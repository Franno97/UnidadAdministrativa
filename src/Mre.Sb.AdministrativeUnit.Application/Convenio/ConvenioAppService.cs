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
using Volo.Abp.Domain.Entities;
using Mre.Sb.AdministrativeUnit.Permissions;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{

    public class ConvenioAppService :
      CrudAppService<
          Convenio,
          ConvenioDto,
          Guid,
          GetConvenioInput,
          CrearActualizarConvenioDto>,
      IConvenioAppService
    {
        private readonly IRepository<Exoneracion> exonerationRepository;
        private readonly IRepository<Dominio.Servicio> serviceRepository;
        private readonly ConvenioManager AgreementManager;
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;

        public ConvenioAppService(IRepository<Convenio, Guid> repository,
            IRepository<Exoneracion> exonerationRepository,
            IRepository<Dominio.Servicio> serviceRepository,
        ConvenioManager AgreementManager,
        IStringLocalizer<AdministrativeUnitResource> localizer)
            : base(repository)
        {
            this.exonerationRepository = exonerationRepository;
            this.serviceRepository = serviceRepository;
            this.AgreementManager = AgreementManager;
            this.localizer = localizer;

            //GetPolicyName = AdministrativeUnitPermissions.Convenio.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.Convenio.Default;
            //CreatePolicyName = AdministrativeUnitPermissions.Convenio.Create;
            //UpdatePolicyName = AdministrativeUnitPermissions.Convenio.Update;
            //DeletePolicyName = AdministrativeUnitPermissions.Convenio.Delete;
        }

        public override async Task<ConvenioDto> GetAsync(Guid id)
        {
            await CheckGetPolicyAsync();

            var queryable = await Repository.GetQueryableAsync();
            queryable = queryable.Where(a => a.Id == id);

            var queryableDto = queryable.Select(entity => new ConvenioDto()
            {
                Id = entity.Id,
                Descripcion = entity.Descripcion,
                FechaCreacion = entity.FechaCreacion,
                FechaExpiracion = entity.FechaExpiracion
            });

            var entityDto = await AsyncExecuter.FirstOrDefaultAsync(queryableDto);

            return entityDto;
        }

        public override async Task<PagedResultDto<ConvenioDto>> GetListAsync(GetConvenioInput input)
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

            var queryableDto = queryable.Select(entity => new ConvenioDto()
            {
                Id = entity.Id,
                Descripcion = entity.Descripcion,
                FechaCreacion = entity.FechaCreacion,
                FechaExpiracion = entity.FechaExpiracion
            });

            var entityDtos = await AsyncExecuter.ToListAsync(queryableDto);

            return new PagedResultDto<ConvenioDto>(
                totalCount,
                entityDtos
            );
        }

        public override async Task<ConvenioDto> CreateAsync(CrearActualizarConvenioDto input)
        {
            await CheckCreatePolicyAsync();

            var entity = await AgreementManager.CreateAsync(
                id: GuidGenerator.Create(),
                description: input.Descripcion,
                creationDate: input.FechaCreacion,
                expirationDate: input.FechaExpiracion
                );

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await GetAsync(entity.Id);
        }

        public async Task<ListResultDto<ConvenioLookupDto>> GetLookupAsync()
        {
            await CheckGetListPolicyAsync();

            var list = await Repository.GetListAsync();

            return new ListResultDto<ConvenioLookupDto>(
                ObjectMapper.Map<List<Convenio>, List<ConvenioLookupDto>>(list)
            );
        }


        #region Exoneration

        public async Task<ExonerationDto> AddExonerationAsync(Guid agreementId, CrearExoneracionDto input)
        {
            await CheckUpdatePolicyAsync();

            var agreement = await AgreementManager.AddExonerationAsync(
                agreementId, 
                input.ServicioId, 
                input.Valor, 
                input.TipoExoneracionId,
                input.EntidadAuspicianteId,
                input.PaisId,
                input.EdadInicial,
                input.EdadFinal,
                input.Discapacitado);

            await Repository.UpdateAsync(agreement, autoSave: true);


            return await GetExonerationAsync(agreementId, input.ServicioId);
        }

        public async Task<ExonerationDto> UpdateExonerationAsync(Guid agreementId, Guid serviceId, ActualizarExoneracionDto input)
        {

            await CheckUpdatePolicyAsync();

            var queryable = await Repository
                        .WithDetailsAsync(p => p.Exoneraciones)
                        ;

            queryable = queryable.Where(p => p.Id == agreementId);

            var agreement = await AsyncExecuter.SingleOrDefaultAsync(queryable);
            if (agreement == null)
            {
                throw new EntityNotFoundException(typeof(Mre.Sb.UnidadAdministrativa.Dominio.Convenio), agreementId);
            }

            var exoneration = agreement.Exoneraciones.SingleOrDefault(p => p.ServicioId == serviceId);
            if (exoneration == null)
            {
                throw new EntityNotFoundException(typeof(Mre.Sb.UnidadAdministrativa.Dominio.Exoneracion), serviceId);
            }


            exoneration.Valor = input.Valor;
            exoneration.TipoExoneracionId = input.TipoExoneracionId;
            exoneration.EntidadAuspicianteId = input.EntidadAuspicianteId;
            exoneration.PaisId = input.PaisId;
            exoneration.EdadInicial = input.EdadInicial;
            exoneration.EdadFinal = input.EdadFinal;
            exoneration.Discapacitado = input.Discapacitado;

            await Repository.UpdateAsync(agreement, autoSave: true);


            return await GetExonerationAsync(agreementId, serviceId);

        }

        public async Task RemoveExonerationAsync(Guid id, Guid serviceId)
        {
            await CheckUpdatePolicyAsync();

            //TODO: #issues/69 Validar tramites activos en microservicio de tramites

            var exoneration = await AgreementManager.RemoveExonerationAsync(id, serviceId);

            await Repository.UpdateAsync(exoneration, autoSave: true);

            await CurrentUnitOfWork.SaveChangesAsync();

        }

        public async Task<ExonerationDto> GetExonerationAsync(Guid agreementId, Guid serviceId)
        {

            await CheckGetPolicyAsync();

            var queryable = await exonerationRepository.GetQueryableAsync();
            var queryableService = await serviceRepository.GetQueryableAsync();

            queryable = queryable.Where(p => p.ConvenioId == agreementId);
            queryable = queryable.Where(p => p.ServicioId == serviceId);

            var queryableDto = from entity in queryable
                               join service in queryableService on entity.ServicioId equals service.Id
                               select new ExonerationDto()
                               {
                                   ConvenioId = entity.ConvenioId,
                                   ServicioId = entity.ServicioId,
                                   Servicio = service.Nombre,
                                   TipoServicio = service.TipoServicio.Nombre,
                                   Valor = entity.Valor,
                                   TipoExoneracionId = entity.TipoExoneracionId,
                                   TipoExoneracion = entity.TipoExoneracion.Nombre,
                                   EntidadAuspicianteId = entity.EntidadAuspicianteId,
                                   EntidadAuspiciante = entity.EntidadAuspiciante.Nombre,
                                   PaisId = entity.PaisId,
                                   EdadInicial = entity.EdadInicial,
                                   EdadFinal = entity.EdadFinal,
                                   Discapacitado = entity.Discapacitado
                               }
                    ;

            var entityDto = await AsyncExecuter.SingleOrDefaultAsync(queryableDto);

            return entityDto;
        }

        public async Task<PagedResultDto<ExonerationDto>> GetExonerationsAsync(Guid agreementId, GetExoneracionInput input)
        {
            await CheckGetPolicyAsync();

            var queryable = await exonerationRepository.GetQueryableAsync();
            var queryableService = await serviceRepository.GetQueryableAsync();

            queryable = queryable.Where(p => p.ConvenioId == agreementId);


            var totalCount = await AsyncExecuter.CountAsync(queryable);


            var queryableDto = from entity in queryable
                               join service in queryableService on entity.ServicioId equals service.Id
                               select new ExonerationDto()
                               {
                                   ConvenioId = entity.ConvenioId,
                                   ServicioId = entity.ServicioId,
                                   Servicio = service.Nombre,
                                   TipoServicio = service.TipoServicio.Nombre,
                                   Valor = entity.Valor,
                                   TipoExoneracionId = entity.TipoExoneracionId,
                                   TipoExoneracion = entity.TipoExoneracion.Nombre,
                                   EntidadAuspicianteId = entity.EntidadAuspicianteId,
                                   EntidadAuspiciante = entity.EntidadAuspiciante.Nombre,
                                   PaisId = entity.PaisId,
                                   EdadInicial = entity.EdadInicial,
                                   EdadFinal = entity.EdadFinal,
                                   Discapacitado = entity.Discapacitado
                               }
                    ;

            var entityDtos = await AsyncExecuter.ToListAsync(queryableDto);

            return new PagedResultDto<ExonerationDto>(
                totalCount,
                entityDtos
            );
        }

        public async Task<ListResultDto<ExonerationDto>> ObtenerExoneracionPorServicioAsync(Guid serviceId) {
            var queryable = await exonerationRepository.GetQueryableAsync();
            queryable = queryable.Where(x => x.ServicioId == serviceId);

            var queryableService = await serviceRepository.GetQueryableAsync();
            queryableService = queryableService.Where(x => x.Id == serviceId);

            var queryableDto = from entity in queryable
                               join service in queryableService on entity.ServicioId equals service.Id
                               select new ExonerationDto()
                               {
                                   ConvenioId = entity.ConvenioId,
                                   ServicioId = entity.ServicioId,
                                   Servicio = service.Nombre,
                                   TipoServicio = service.TipoServicio.Nombre,
                                   Valor = entity.Valor,
                                   TipoExoneracionId = entity.TipoExoneracionId,
                                   TipoExoneracion = entity.TipoExoneracion.Nombre,
                                   EntidadAuspicianteId = entity.EntidadAuspicianteId,
                                   EntidadAuspiciante = entity.EntidadAuspiciante.Nombre,
                                   PaisId = entity.PaisId,
                                   EdadInicial = entity.EdadInicial,
                                   EdadFinal = entity.EdadFinal,
                                   Discapacitado = entity.Discapacitado
                               };

            var resultadoDto= await AsyncExecuter.ToListAsync(queryableDto);

            return new ListResultDto<ExonerationDto>(resultadoDto);
        }


        #endregion Exoneration



    }

}
