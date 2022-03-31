using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using System.Linq;
using Volo.Abp;
using Microsoft.Extensions.Localization;
using Mre.Sb.AdministrativeUnit.Localization;
using Mre.Sb.AdministrativeUnit.Permissions;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{

    public class ArancelAppService :
      CrudAppService<
          Arancel,
          ArancelDto,
          Guid,
          ObtenerArancelInput,
          CrearActualizarArancelDto>,
      IArancelAppService
    {
        private readonly ArancelManager TariffManager;
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;
        private readonly IRepository<JerarquiaArancelaria> JerarquiaRepository;

        public ArancelAppService(IRepository<Arancel, Guid> repository,
        ArancelManager tariffManager,
        IStringLocalizer<AdministrativeUnitResource> localizer,
        IRepository<JerarquiaArancelaria> jerarquiaRepository)
            : base(repository)
        {
            this.TariffManager = tariffManager;
            this.localizer = localizer;
            this.JerarquiaRepository = jerarquiaRepository;

            //GetPolicyName = AdministrativeUnitPermissions.Tariff.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.Tariff.Default;
            //CreatePolicyName = AdministrativeUnitPermissions.Tariff.Create;
            //UpdatePolicyName = AdministrativeUnitPermissions.Tariff.Update;
            //DeletePolicyName = AdministrativeUnitPermissions.Tariff.Delete;
        }

        public override async Task<ArancelDto> GetAsync(Guid id)
        {
            await CheckGetPolicyAsync();

            var queryable = await Repository.GetQueryableAsync();
            queryable = queryable.Where(a => a.Id == id);

            var queryableDto = queryable.Select(entity => new ArancelDto()
            {
                Id = entity.Id,
                Descripcion= entity.Descripcion,
                MonedaId = entity.MonedaId,
                Moneda = entity.Moneda.Nombre,
                Activo = entity.Activo
            });

            var entityDto = await AsyncExecuter.FirstOrDefaultAsync(queryableDto);

            return entityDto;
        }

        public override async Task<PagedResultDto<ArancelDto>> GetListAsync(ObtenerArancelInput input)
        {

            await CheckGetListPolicyAsync();

            var queryable = await CreateFilteredQueryAsync(input);

            queryable = queryable.WhereIf(
                    !input.Filter.IsNullOrWhiteSpace(),
                    u => u.Descripcion.Contains(input.Filter)
                );

            var totalCount = await AsyncExecuter.CountAsync(queryable);

            queryable = ApplySorting(queryable, input);
            queryable = ApplyPaging(queryable, input);

            var queryableDto = queryable.Select(entity => new ArancelDto()
            {
                Id = entity.Id,
                Descripcion = entity.Descripcion,
                MonedaId = entity.MonedaId,
                Moneda = entity.Moneda.Nombre,
                Activo = entity.Activo,
            });

            var entityDtos = await AsyncExecuter.ToListAsync(queryableDto);

            return new PagedResultDto<ArancelDto>(
                totalCount,
                entityDtos
            );
        }

        public override async Task<ArancelDto> CreateAsync(CrearActualizarArancelDto input)
        {
            await CheckCreatePolicyAsync();

            var entity = await TariffManager.CreateAsync(
                id: GuidGenerator.Create(),
                description: input.Descripcion,
                currencyId: input.MonedaId,
                isActive: input.Activo
                );

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await GetAsync(entity.Id);
        }

        public async Task<ListResultDto<ArancelLookupDto>> GetLookupAsync()
        {
            await CheckGetListPolicyAsync();

            var list = await Repository.GetListAsync();

            return new ListResultDto<ArancelLookupDto>(
                ObjectMapper.Map<List<Arancel>, List<ArancelLookupDto>>(list)
            );
        }

        public async Task ChangeStateAsync(Guid id, bool isActive)
        {
            await CheckUpdatePolicyAsync();

            //TODO: Validar tramites activos
            var existing = false;

            if (existing)
            {
                throw new UserFriendlyException(string.Format(localizer["AdministrativeUnit:ThereAreActiveProcess"]));
            }

            var entity = await TariffManager.ChangeStateAsync(id, isActive);

            await Repository.UpdateAsync(entity, autoSave: true);
        }



        #region Jerarquia Arancelaria

        public async Task<PagedResultDto<JerarquiaArancelariaDto>> ObtenerJerarquiasArancelariasAsync(Guid arancelId, GetJerarquiaArancelariaInput input)
        {

            await CheckGetPolicyAsync();

            var queryable = await Repository.GetQueryableAsync();
            var queryableJerarquia = await JerarquiaRepository.GetQueryableAsync();

            queryable = queryable.Where(p => p.Id == arancelId);

            var queryableDto = from entity in queryable
                               join jerarquia in queryableJerarquia on entity.Id equals jerarquia.ArancelId
                               select new JerarquiaArancelariaDto()
                               {
                                   Id = jerarquia.Id,
                                   Descripcion = jerarquia.Descripcion,
                                   NumeroJerarquia = jerarquia.NumeroJerarquia,
                                   Orden = jerarquia.Orden,
                                   TipoArancelId = jerarquia.TipoArancel.Id,
                                   TipoArancel = jerarquia.TipoArancel.Nombre,
                                   ArancelId = jerarquia.ArancelId
                               };

            var totalCount = await AsyncExecuter.CountAsync(queryableDto);

            var entityDtos = await AsyncExecuter.ToListAsync(queryableDto);

            return new PagedResultDto<JerarquiaArancelariaDto>(
                totalCount,
                entityDtos
            );

        }

        public async Task<JerarquiaArancelariaDto> ObtenerJerarquiaArancelariaAsync(Guid arancelId, Guid jerarquiaId)
        {

            await CheckGetPolicyAsync();

            var queryable = await Repository.WithDetailsAsync(p => p.Jerarquias);
            queryable = queryable.Where(a => a.Id == arancelId);
            var queryableJerarquia = queryable.SelectMany(entity => entity.Jerarquias)
                    .Where(j => j.Id == jerarquiaId);

            var jerarquiaDto = queryableJerarquia.Select(entity => new JerarquiaArancelariaDto()
            {
                Id = entity.Id,
                ArancelId = entity.ArancelId,
                Descripcion = entity.Descripcion,
                TipoArancelId = entity.TipoArancelId,
                TipoArancel = entity.TipoArancel.Nombre,
                Orden = entity.Orden,
                NumeroJerarquia = entity.NumeroJerarquia
            });

            var resultado = await AsyncExecuter.SingleOrDefaultAsync(jerarquiaDto);

            return resultado;
        }
        

        public async Task<JerarquiaArancelariaDto> AgregarJerarquiaArancelariaAsync(Guid arancelId, CrearActualizarJerarquiaArancelariaDto input)
        {
            await CheckUpdatePolicyAsync();

            var jerarquia = await TariffManager.CrearJerarquiaArancelariaAsync(
                id: GuidGenerator.Create(),
                arancelId: arancelId, 
                tipoArancelId: input.TipoArancelId, 
                descripcion: input.Descripcion, 
                orden: input.Orden, 
                numeroJerarquia: input.NumeroJerarquia);

            var arancel = await TariffManager.AgregarJerarquiaArancelariaAsync(jerarquia);

            await Repository.UpdateAsync(arancel, autoSave: true);

            return await ObtenerJerarquiaArancelariaAsync(arancelId, jerarquia.Id);
        }


        public async Task<JerarquiaArancelariaDto> ActualizarJerarquiaArancelariaAsync(Guid arancelId, Guid jerarquiaId, CrearActualizarJerarquiaArancelariaDto input)
        {

            await CheckUpdatePolicyAsync();

            var queryable = await Repository
                        .WithDetailsAsync(p => p.Jerarquias);

            queryable = queryable.Where(p => p.Id == arancelId);

            var arancel = await AsyncExecuter.SingleOrDefaultAsync(queryable);
            if (arancel == null)
            {
                throw new EntityNotFoundException(typeof(Mre.Sb.UnidadAdministrativa.Dominio.Arancel), arancelId);
            }

            var jerarquia = arancel.Jerarquias.SingleOrDefault(p => p.Id == jerarquiaId);
            if (jerarquia == null)
            {
                throw new EntityNotFoundException(typeof(Mre.Sb.UnidadAdministrativa.Dominio.JerarquiaArancelaria), jerarquiaId);
            }

            jerarquia.TipoArancelId = input.TipoArancelId;
            jerarquia.Descripcion = input.Descripcion;
            jerarquia.Orden = input.Orden;
            jerarquia.NumeroJerarquia = input.NumeroJerarquia;

            await Repository.UpdateAsync(arancel, autoSave: true);


            return await ObtenerJerarquiaArancelariaAsync(arancelId, jerarquiaId);

        }

        public async Task QuitarJerarquiaArancelariaAsync(Guid arancelId, Guid jerarquiaId)
        {
            await CheckUpdatePolicyAsync();

            var arancel = await TariffManager.QuitarJerarquiaArancelariaAsync(arancelId, jerarquiaId);

            await Repository.UpdateAsync(arancel, autoSave: true);

            await CurrentUnitOfWork.SaveChangesAsync();
        }

        #endregion Jerarquia Arancelaria

    }

}
