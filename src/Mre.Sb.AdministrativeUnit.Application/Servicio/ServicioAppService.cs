using Microsoft.Extensions.Localization;
using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.AdministrativeUnit.Localization;
using Mre.Sb.AdministrativeUnit.Permissions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Reflection;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class ServicioAppService :
      CrudAppService<
          Dominio.Servicio,
          ServicioDto,
          Guid,
          GetServicioInput,
          CrearActualizarServicioDto>,
      IServicioAppService
    {
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;

        public ServicioManager ServiceManager { get; }

        public ServicioAppService(IRepository<Dominio.Servicio, Guid> repository,
            ServicioManager serviceManager,
            IStringLocalizer<AdministrativeUnitResource> localizer)
            : base(repository)
        {
            ServiceManager = serviceManager;
            this.localizer = localizer;



            //GetPolicyName = AdministrativeUnitPermissions.Servicio.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.Servicio.Default;
            CreatePolicyName = AdministrativeUnitPermissions.Service.Create;
            UpdatePolicyName = AdministrativeUnitPermissions.Service.Update;
            DeletePolicyName = AdministrativeUnitPermissions.Service.Delete;

        }

        public override async Task<ServicioDto> GetAsync(Guid id)
        {
            await CheckGetPolicyAsync();

            var queryable = await Repository.GetQueryableAsync();
            queryable = queryable.Where(a => a.Id == id);

            
            var queryableDto = queryable.Select(entity => new ServicioDto()
            {
                Id= entity.Id,
                Nombre = entity.Nombre,
                TipoServicioId = entity.TipoServicioId,
                TipoServicio = entity.TipoServicio.Nombre,
                AtencionPresencial = entity.AtencionPresencial,
                AtencionSemiPresencial = entity.AtencionSemiPresencial,
                AtencionVirtual = entity.AtencionVirtual,
                Activo = entity.Activo
            });

            var entityDto = await AsyncExecuter.SingleOrDefaultAsync(queryableDto);

            return entityDto;
        }

        public override async Task<PagedResultDto<ServicioDto>> GetListAsync(GetServicioInput input)
        {

            await CheckGetListPolicyAsync();

            var queryable = await CreateFilteredQueryAsync(input);

            queryable = queryable.WhereIf(
                    !input.Filter.IsNullOrWhiteSpace(),
                    u =>
                        u.Nombre.Contains(input.Filter)
                );

            var totalCount = await AsyncExecuter.CountAsync(queryable);

            queryable = ApplySorting(queryable, input);
            queryable = ApplyPaging(queryable, input);

             
            var queryableDto = queryable.Select(entity => new ServicioDto()
            {
                Id = entity.Id,
                Nombre = entity.Nombre,
                TipoServicioId = entity.TipoServicioId,
                TipoServicio = entity.TipoServicio.Nombre,
                AtencionPresencial = entity.AtencionPresencial,
                AtencionSemiPresencial = entity.AtencionSemiPresencial,
                AtencionVirtual = entity.AtencionVirtual,
                Activo = entity.Activo

            });

            var entityDtos = await AsyncExecuter.ToListAsync(queryableDto);

            return new PagedResultDto<ServicioDto>(
                totalCount,
                entityDtos
            );
        }

        public override async Task<ServicioDto> CreateAsync(CrearActualizarServicioDto input)
        {
            //TODO: #issues/28
            await CheckCreatePolicyAsync();

            var entity = await ServiceManager.CreateAsync(GuidGenerator.Create(),
                name: input.Nombre,
                serviceTypeId:input.TipoServicioId,
                isPresentialAttention:input.AtencionPresencial,
                isSemipresentialAttention:input.AtencionSemiPresencial,
                isVirtualAttention: input.AtencionVirtual,
                isActive: input.Activo);

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await GetAsync(entity.Id);
        }

        public override async Task<ServicioDto> UpdateAsync(Guid id, CrearActualizarServicioDto input)
        {
            //TODO: #issues/28

            await CheckUpdatePolicyAsync();

            var entity = await GetEntityByIdAsync(id);

            if (!entity.Nombre.Equals(input.Nombre, StringComparison.OrdinalIgnoreCase)) {

               await ServiceManager.ChangeNameAsync(entity, input.Nombre);
            }


            if (input.Activo.Equals(false))
            {

                //TODO: Validar tramites activos. Consultar al microservicio de tramites
                //JSA. Colocar la logica en el servicio aplicacion, puesto
                //que la verificacion si existe tramites seguramente se debe realizar
                //con un rest api, y esta dependencia no puede estar en el dominio
                var existing = false;

                if (existing)
                {
                    throw new AbpException(string.Format(localizer["Service:ThereAreActiveProcess"], input.Nombre));
                }

                await ServiceManager.ChangeIsActiveAsync(entity, input.Activo);
            }


            await MapToEntityAsync(input, entity);
            await Repository.UpdateAsync(entity, autoSave: true);

            return await GetAsync(entity.Id);
        }

        public virtual async Task<ListResultDto<ServicioDto>> GetLookupAsync(bool? isActive)
        {

            await CheckGetListPolicyAsync();

            var queryable = await Repository.GetQueryableAsync();

            queryable = queryable.WhereIf(
                    isActive.HasValue,
                    u =>
                        u.Activo == isActive.Value
                );

             
            var queryableDto = queryable.Select(entity => new ServicioDto()
            {
                Id = entity.Id,
                Nombre = entity.Nombre,
                TipoServicioId = entity.TipoServicioId,
                TipoServicio = entity.TipoServicio.Nombre,
                AtencionPresencial = entity.AtencionPresencial,
                AtencionSemiPresencial = entity.AtencionSemiPresencial,
                AtencionVirtual = entity.AtencionVirtual,
                Activo = entity.Activo

            });

            var entityDtos = await AsyncExecuter.ToListAsync(queryableDto);

            return new ListResultDto<ServicioDto>(entityDtos);

        }
    }
}
