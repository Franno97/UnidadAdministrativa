using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using System.Linq;
using System.Linq.Dynamic.Core;
using Volo.Abp.Auditing;
using Volo.Abp;
using Mre.Sb.AdministrativeUnit.Permissions;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{

    public class PartidaArancelariaAppService :
      CrudAppService<
          PartidaArancelaria,
          PartidaArancelariaDto,
          Guid,
          GetPartidaArancelariaInput,
          CrearActualizarPartidaArancelariaDto>,
      IPartidaArancelariaAppService
    {
        private readonly PartidaArancelariaManager tariffHeadingManager;
        private readonly IRepository<PartidaArancelariaServicio> tariffHeadingServiceRespository;
        private readonly IRepository<Dominio.Servicio> serviceRepository;
        public PartidaArancelariaAppService(IRepository<PartidaArancelaria, Guid> repository,
        PartidaArancelariaManager tariffHeadingManager,
        IRepository<PartidaArancelariaServicio> tariffHeadingServiceRespository,
        IRepository<Dominio.Servicio> serviceRepository)
            : base(repository)
        {
            this.tariffHeadingManager = tariffHeadingManager;
            this.tariffHeadingServiceRespository = tariffHeadingServiceRespository;
            this.serviceRepository = serviceRepository;
            //GetPolicyName = AdministrativeUnitPermissions.TariffHeading.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.TariffHeading.Default;
            //CreatePolicyName = AdministrativeUnitPermissions.TariffHeading.Create;
            //UpdatePolicyName = AdministrativeUnitPermissions.TariffHeading.Update;
            //DeletePolicyName = AdministrativeUnitPermissions.TariffHeading.Delete;
        }

        public override async Task<PartidaArancelariaDto> GetAsync(Guid id)
        {
            await CheckGetPolicyAsync();

            var queryable = await Repository.GetQueryableAsync();
            queryable = queryable.Where(a => a.Id == id);

            var queryableDto = queryable.Select(entity => new PartidaArancelariaDto()
            {
                Id = entity.Id,
                Descripcion = entity.Descripcion,
                NumeroPartida = entity.NumeroPartida,
                Valor = entity.Valor,
                JerarquiaArancelariaId = entity.JerarquiaArancelariaId
            });

            var entityDto = await AsyncExecuter.FirstOrDefaultAsync(queryableDto);

            return entityDto;
        }

        public override async Task<PagedResultDto<PartidaArancelariaDto>> GetListAsync(GetPartidaArancelariaInput input)
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

            var queryableDto = queryable.Select(entity => new PartidaArancelariaDto()
            {
                Id = entity.Id,
                Descripcion = entity.Descripcion,
                NumeroPartida = entity.NumeroPartida,
                Valor = entity.Valor,
                JerarquiaArancelariaId = entity.JerarquiaArancelariaId
            });

            var entityDtos = await AsyncExecuter.ToListAsync(queryableDto);

            return new PagedResultDto<PartidaArancelariaDto>(
                totalCount,
                entityDtos
            );
        }

        public override async Task<PartidaArancelariaDto> CreateAsync(CrearActualizarPartidaArancelariaDto input)
        {
            await CheckCreatePolicyAsync();

            var entity = await tariffHeadingManager.CreateAsync(
                id: GuidGenerator.Create(),
                description: input.Descripcion,
                headingNumber: input.NumeroPartida,
                value: input.Valor,
                tariffHierarchyId: input.JerarquiaArancelariaId
                );

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await GetAsync(entity.Id);
        }

        public async Task<ListResultDto<PartidaArancelariaLookupDto>> GetLookupAsync()
        {
            await CheckGetListPolicyAsync();

            var list = await Repository.GetListAsync();

            return new ListResultDto<PartidaArancelariaLookupDto>(
                ObjectMapper.Map<List<PartidaArancelaria>, List<PartidaArancelariaLookupDto>>(list)
            );
        }

        #region Services
        public async Task<PagedResultDto<PartidaArancelariaServicioInfoDto>> GetServicesAsync(Guid tariffHeadingId, ObtenerPartidaArancelariaServicioInputDto input)
        {
            await CheckGetPolicyAsync();

            var queryable = await tariffHeadingServiceRespository.GetQueryableAsync();
            var queryableService = await serviceRepository.GetQueryableAsync();

            queryable = queryable.Where(t => t.PartidaArancelariaId == tariffHeadingId);


            var totalCount = await AsyncExecuter.CountAsync(queryable);

            queryable = ApplySorting(queryable, input);
            queryable = ApplyPaging(queryable, input);


            var queryableDto = from entity in queryable
                               join service in queryableService on entity.ServicioId equals service.Id
                               select new PartidaArancelariaServicioInfoDto()
                               {
                                   ServicioId = entity.ServicioId,
                                   Servicio = service.Nombre,
                                   TipoServicio = service.TipoServicio.Nombre,
                                   AtencionPresencial = service.AtencionPresencial,
                                   AtencionSemiPresencial = service.AtencionSemiPresencial,
                                   AtencionVirtual = service.AtencionVirtual,
                                   Activo = service.Activo
                               };
                    
            var entityDtos = await AsyncExecuter.ToListAsync(queryableDto);

            return new PagedResultDto<PartidaArancelariaServicioInfoDto>(
                totalCount,
                entityDtos
            );

        }

        public async Task AddServiceAsync(Guid tariffHeadingId, CrearPartidaArancelariaServicioDto input)
        {
            await CheckUpdatePolicyAsync();

            var tariffHeading= await tariffHeadingManager.AddServiceAsync(tariffHeadingId, input.ServicioId);

            await Repository.UpdateAsync(tariffHeading, autoSave: true);

        }

        public async Task RemoveServiceAsync(Guid tariffHeadingId, Guid serviceId)
        {
            await CheckUpdatePolicyAsync();

            var tariffHeading = await tariffHeadingManager.RemoveServiceAsync(tariffHeadingId, serviceId);

            await Repository.UpdateAsync(tariffHeading, autoSave: true);

        }

        #endregion

        protected virtual IQueryable<TEntity> ApplySorting<TEntity>(IQueryable<TEntity> query, PagedAndSortedResultRequestDto input)
        {
            //Try to sort query if available
            if (input is ISortedResultRequest sortInput)
            {
                if (!sortInput.Sorting.IsNullOrWhiteSpace())
                {
                    return query.OrderBy(sortInput.Sorting);
                }
            }

            //IQueryable.Task requires sorting, so we should sort if Take will be used.
            if (input is ILimitedResultRequest)
            {
                return ApplyDefaultSorting(query);
            }

            //No sorting
            return query;
        }

        protected virtual IQueryable<TEntity> ApplyDefaultSorting<TEntity>(IQueryable<TEntity> query)
        {
            if (typeof(TEntity).IsAssignableTo<IHasCreationTime>())
            {
                return query.OrderByDescending(e => ((IHasCreationTime)e).CreationTime);
            }



            throw new AbpException("No sorting specified but this query requires sorting. Override the ApplyDefaultSorting method for your application service derived from AbstractKeyReadOnlyAppService!");
        }

        protected virtual IQueryable<TEntity> ApplyPaging<TEntity>(IQueryable<TEntity> query, PagedAndSortedResultRequestDto input)
        {
            //Try to use paging if available
            if (input is IPagedResultRequest pagedInput)
            {
                return query.PageBy(pagedInput);
            }

            //Try to limit query result if available
            if (input is ILimitedResultRequest limitedInput)
            {
                return query.Take(limitedInput.MaxResultCount);
            }

            //No paging
            return query;
        }

    }

}
