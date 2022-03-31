using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.Geographical;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Auditing;
using Volo.Abp.Domain.Entities;
using Volo.Abp.Domain.Repositories;
using System.Linq.Dynamic.Core;
using Mre.Sb.AdministrativeUnit.Permissions;
using Microsoft.Extensions.Localization;
using Mre.Sb.AdministrativeUnit.Localization;
using Mre.Sb.UnidadAdministrativa.Servicio;
using FluentValidation;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{


    public class UnidadAdministrativaAppService :
      CrudAppService<
          Dominio.UnidadAdministrativa,
          UnidadAdministrativaDto,
          Guid,
          GetUnidadAdministrativaInput,
          CrearActualizarUnidadAdministrativaDto>,
      IUnidadAdministrativaAppService
    {
        private readonly CountryData _countryData;

        public UnidadAdministrativaManager UnidadAdministrativaManager { get; }

        private readonly IRepository<UnidadAdministrativaFuncionario> _administrativeUnitFunctionaryRespository;
        private readonly IRepository<UnidadAdministrativaServicio> _administrativeUnitServiceRespository;
        private readonly IRepository<Dominio.Servicio> _serviceRepository;
        private readonly IRepository<Signatario> _signerRespository;
        private readonly IConfiguracionSignatarioAppService _configuracionSignatarioAppService;
        private readonly IStringLocalizer<AdministrativeUnitResource> _localizer;

        public UnidadAdministrativaAppService(
            IRepository<Dominio.UnidadAdministrativa,Guid> repository,
            UnidadAdministrativaManager administrativeUnitManager,
            CountryData countryData,
            IRepository<UnidadAdministrativaFuncionario> administrativeUnitFunctionaryRespository,
            IRepository<UnidadAdministrativaServicio> administrativeUnitServiceRespository,
            IRepository<Dominio.Servicio> serviceRepository,
            IRepository<Cargo> positionRepository,
            IRepository<Signatario> signerRespository,
            IConfiguracionSignatarioAppService configuracionSignatarioAppService,
            IStringLocalizer<AdministrativeUnitResource> localizer)
            : base(repository)
        {
            UnidadAdministrativaManager = administrativeUnitManager;
            _countryData = countryData;
            _administrativeUnitFunctionaryRespository = administrativeUnitFunctionaryRespository;
            _administrativeUnitServiceRespository = administrativeUnitServiceRespository;
            _serviceRepository = serviceRepository;
            _signerRespository = signerRespository;
            this._configuracionSignatarioAppService = configuracionSignatarioAppService;
            this._localizer = localizer;

            //GetPolicyName = AdministrativeUnitPermissions.UnidadAdministrativa.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.UnidadAdministrativa.Default;
            CreatePolicyName = AdministrativeUnitPermissions.AdministrativeUnit.Create;
            UpdatePolicyName = AdministrativeUnitPermissions.AdministrativeUnit.Update;
            DeletePolicyName = AdministrativeUnitPermissions.AdministrativeUnit.Delete;



        }


        #region Unidad Administrativa Consultas

        public override async Task<UnidadAdministrativaDto> GetAsync(Guid id)
        {
            await CheckGetPolicyAsync();

            var queryable = await Repository.GetQueryableAsync();
            queryable = queryable.Where(a => a.Id == id);

            var queryableDto = queryable.Select(entity => new UnidadAdministrativaDto()
            {
                Id = entity.Id,
                TipoUnidadAdministrativa = entity.TipoUnidadAdministrativa.Nombre,
                Siglas = entity.Siglas,
                Codigo = entity.Codigo,
                TipoUnidadAdministrativaId = entity.TipoUnidadAdministrativaId,
                Banco = entity.Banco.Nombre,
                BancoId = entity.BancoId,
                PaisId = entity.PaisId,
                Moneda = entity.Moneda.Nombre,
                MonedaId = entity.MonedaId,
                Activo = entity.Activo,
                Nivel = entity.Nivel.Nombre,
                NivelId = entity.NivelId,
                Nombre = entity.Nombre,
                FechaFinOperacion = entity.FechaFinOperacion,
                FechaInicioOperacion = entity.FechaInicioOperacion,
                RegionId = entity.RegionId,
                Direccion = entity.Direccion,
                Ciudad = entity.Ciudad,
                CodigoPostal = entity.CodigoPostal,
                Observaciones = entity.Observaciones,
                DependenciaAdministrativaId = entity.DependenciaAdministrativaId,
                DependenciaAdministrativa = entity.DependenciaAdministrativa.Nombre,
                TipoCuentaBancariaId = entity.TipoCuentaBancariaId,
                TipoCuentaBancaria = entity.TipoCuentaBancaria.Nombre,
                TitularCuentaBancaria = entity.TitularCuentaBancaria,
                NumeroCuentaBancaria = entity.NumeroCuentaBancaria
            });


            var entityDto = await AsyncExecuter.SingleOrDefaultAsync(queryableDto);

            if (entityDto != null) {
                //Realizar consulta jurisdiccion separada
                var queryableJurisdiccion = queryable.SelectMany(entity => entity.Jurisdiccion);
                var jurisdiccionLista = await AsyncExecuter.ToListAsync(queryableJurisdiccion);

                entityDto.Jurisdiccion = jurisdiccionLista.Select(a => a.Ciudad);

            }

            AddDataGeographical(entityDto);


            return entityDto;
        }


        public  async Task<UnidadAdministrativaDto> ObtenerPorCodigoAsync(string codigo)
        {
            await CheckGetPolicyAsync();

            var queryable = await Repository.GetQueryableAsync();
            queryable = queryable.Where(a => a.Codigo == codigo.ToUpper());

            var queryableDto = queryable.Select(entity => new UnidadAdministrativaDto()
            {
                Id = entity.Id,
                TipoUnidadAdministrativa = entity.TipoUnidadAdministrativa.Nombre,
                Siglas = entity.Siglas,
                Codigo = entity.Codigo,
                TipoUnidadAdministrativaId = entity.TipoUnidadAdministrativaId,
                Banco = entity.Banco.Nombre,
                BancoId = entity.BancoId,
                PaisId = entity.PaisId,
                Moneda = entity.Moneda.Nombre,
                MonedaId = entity.MonedaId,
                Activo = entity.Activo,
                Nivel = entity.Nivel.Nombre,
                NivelId = entity.NivelId,
                Nombre = entity.Nombre,
                FechaFinOperacion = entity.FechaFinOperacion,
                FechaInicioOperacion = entity.FechaInicioOperacion,
                RegionId = entity.RegionId,
                Direccion = entity.Direccion,
                Ciudad = entity.Ciudad,
                CodigoPostal = entity.CodigoPostal,
                Observaciones = entity.Observaciones,
                DependenciaAdministrativaId = entity.DependenciaAdministrativaId,
                DependenciaAdministrativa = entity.DependenciaAdministrativa.Nombre,
                TipoCuentaBancariaId = entity.TipoCuentaBancariaId,
                TipoCuentaBancaria = entity.TipoCuentaBancaria.Nombre,
                TitularCuentaBancaria = entity.TitularCuentaBancaria,
                NumeroCuentaBancaria = entity.NumeroCuentaBancaria
            });


            var entityDto = await AsyncExecuter.SingleOrDefaultAsync(queryableDto);

            if (entityDto != null)
            {
                //Realizar consulta jurisdiccion separada
                var queryableJurisdiccion = queryable.SelectMany(entity => entity.Jurisdiccion);
                var jurisdiccionLista = await AsyncExecuter.ToListAsync(queryableJurisdiccion);

                entityDto.Jurisdiccion = jurisdiccionLista.Select(a => a.Ciudad);

            }

            AddDataGeographical(entityDto);


            return entityDto;
        }


        public override async Task<PagedResultDto<UnidadAdministrativaDto>> GetListAsync(GetUnidadAdministrativaInput input)
        {

            await CheckGetListPolicyAsync();

            var queryable = await CreateFilteredQueryAsync(input);
         

            queryable = queryable.WhereIf(
                    !input.Filter.IsNullOrWhiteSpace(),
                    u =>
                       u.Nombre.ToUpper().Contains(input.Filter.ToUpper())
                       || u.Siglas.ToUpper().Contains(input.Filter.ToUpper())
                       || u.Codigo.ToUpper().Contains(input.Filter.ToUpper())
                );

            queryable = queryable.WhereIf(
                  !input.TipoUnidadAdministrativaId.IsNullOrWhiteSpace(),
                  u =>
                      u.TipoUnidadAdministrativaId == input.TipoUnidadAdministrativaId
              );

            var totalCount = await AsyncExecuter.CountAsync(queryable);

            queryable = ApplySortingCustom(queryable, input);
            queryable = ApplyPagingCustom(queryable, input);

            var queryableDto = queryable.Select(entity => new UnidadAdministrativaDto()
            {
                Id = entity.Id,
                TipoUnidadAdministrativa = entity.TipoUnidadAdministrativa.Nombre,
                TipoUnidadAdministrativaId = entity.TipoUnidadAdministrativaId,
                Banco = entity.Banco.Nombre,
                BancoId = entity.BancoId,
                PaisId = entity.PaisId,
                Moneda = entity.Moneda.Nombre,
                MonedaId = entity.MonedaId,
                Activo = entity.Activo,
                Nivel = entity.Nivel.Nombre,
                NivelId = entity.NivelId,
                Nombre = entity.Nombre,
                Siglas = entity.Siglas,
                Codigo = entity.Codigo,
                FechaFinOperacion = entity.FechaFinOperacion,
                FechaInicioOperacion = entity.FechaInicioOperacion,
                RegionId = entity.RegionId,
                Direccion = entity.Direccion,
                Ciudad = entity.Ciudad,
                CodigoPostal = entity.CodigoPostal,
                Observaciones = entity.Observaciones,
                TipoCuentaBancariaId = entity.TipoCuentaBancariaId,
                TipoCuentaBancaria = entity.TipoCuentaBancaria.Nombre,
                TitularCuentaBancaria = entity.TitularCuentaBancaria,
                NumeroCuentaBancaria = entity.NumeroCuentaBancaria
            });

            var entityDtos = await AsyncExecuter.ToListAsync(queryableDto);
 
            //Realizar consulta jurisdiccion separada
            var queryableJurisdiccion = queryable.SelectMany(entity => entity.Jurisdiccion);
            var jurisdiccionLista = await AsyncExecuter.ToListAsync(queryableJurisdiccion);

            foreach (var unidadAdministrativaDto in entityDtos)
            {
                unidadAdministrativaDto.Jurisdiccion = jurisdiccionLista.Where(a=>a.UnidadAdministrativaId==unidadAdministrativaDto.Id).Select(a => a.Ciudad); 
            }

            AddDataGeographical(entityDtos);

            return new PagedResultDto<UnidadAdministrativaDto>(
                totalCount,
                entityDtos
            );
        }

      
        public async Task<ListResultDto<UnidadAdministrativaInfoDto>> GetLookupAdministrativeUnitAsync()
        {
            await CheckGetListPolicyAsync();

            var list = await Repository.GetListAsync();

            return new ListResultDto<UnidadAdministrativaInfoDto>(
                ObjectMapper.Map<List<Dominio.UnidadAdministrativa>, List<UnidadAdministrativaInfoDto>>(list)
            );
        }

        public async Task<ListResultDto<UnidadAdministrativaInfoDto>> ObtenerUnidadAdministrativaPorServicioAsync(Guid servicioId)
        {
            await CheckGetPolicyAsync();

            var consultaServicioUnidadAdministrativa = await _administrativeUnitServiceRespository.GetQueryableAsync();
            var consultaUnidadAdministrativa = await Repository.GetQueryableAsync();
      
            var queryDto = from servicio in consultaServicioUnidadAdministrativa
                           join unidadAdministrativa in consultaUnidadAdministrativa
                           on servicio.UnidadAdministrativaId equals unidadAdministrativa.Id
                           where servicio.ServicioId == servicioId && servicio.Activo
                           select new UnidadAdministrativaInfoDto
                           {
                               Id = unidadAdministrativa.Id,
                               Nombre = unidadAdministrativa.Nombre,
                               PaisId = unidadAdministrativa.PaisId,
                               Siglas = unidadAdministrativa.Siglas,
                               Codigo = unidadAdministrativa.Codigo
                           };


            var resultadoDto = await AsyncExecuter.ToListAsync(queryDto);


            return new ListResultDto<UnidadAdministrativaInfoDto>(resultadoDto);
        }

        public async Task<ListResultDto<UnidadAdministrativaInfoDto>> ObtenerPorListaIds(List<Guid> ids)
        {
            await CheckGetPolicyAsync();

            var query = await Repository.GetQueryableAsync();
            query = query.Where(x => ids.Contains(x.Id));

            var queryDto = query.Select(entidad => new UnidadAdministrativaInfoDto
            {
                Id = entidad.Id,
                Nombre = entidad.Nombre,
                PaisId = entidad.PaisId,
                Siglas = entidad.Siglas,
                Codigo = entidad.Codigo
            });

            var resultadoDto = await AsyncExecuter.ToListAsync(queryDto);


            return new ListResultDto<UnidadAdministrativaInfoDto>(resultadoDto);
        }

        public async Task<ListResultDto<UnidadAdministrativaInfoDto>> ObtenerUnidadAdminsitrativaPorPaisAsync(string codigoPais)
        {
            await CheckGetPolicyAsync();

            var queryable = await Repository.GetQueryableAsync();
            queryable = queryable.Where(a => a.PaisId == codigoPais);

            var queryableDto = queryable.Select(entidad => new UnidadAdministrativaInfoDto()
            {
                Id = entidad.Id,
                Nombre = entidad.Nombre,
                PaisId = entidad.PaisId,
                Siglas = entidad.Siglas,
                Codigo = entidad.Codigo
            });

            var entidadadesDto = await AsyncExecuter.ToListAsync(queryableDto);

            return new ListResultDto<UnidadAdministrativaInfoDto>(entidadadesDto);
        }

        public async Task<ListResultDto<UnidadAdministrativaInfoDto>> ObtenerUnidadAdministrativaPorServicioPaisAsync(Guid servicioId, string codigoPais)
        {
            await CheckGetPolicyAsync();

            var queryPorServicio = await _administrativeUnitServiceRespository.GetQueryableAsync();
            queryPorServicio = queryPorServicio.Where(x => x.ServicioId == servicioId && x.Activo);


            var queryPorPais = await Repository.GetQueryableAsync();
            queryPorPais = queryPorPais.Where(x => x.PaisId == codigoPais && x.Activo);

            var queryDto = from entity in queryPorServicio
                           join unidadAdministrativa in queryPorPais
                           on entity.UnidadAdministrativaId equals unidadAdministrativa.Id
                           select new UnidadAdministrativaInfoDto
                           {
                               Id = unidadAdministrativa.Id,
                               Nombre = unidadAdministrativa.Nombre,
                               Siglas = unidadAdministrativa.Siglas,
                               PaisId = unidadAdministrativa.PaisId,
                               Codigo = unidadAdministrativa.Codigo
                           };

            var resultadoDto = await AsyncExecuter.ToListAsync(queryDto);


            return new ListResultDto<UnidadAdministrativaInfoDto>(resultadoDto);
        }

        public async Task<ListResultDto<UnidadAdministrativaInfoDto>> ObtenerUnidadAdministrativaPorCiudadJurisdiccionAsync(string ciudad)
        {
            await CheckGetPolicyAsync();

            var query = await Repository.GetQueryableAsync();
            query = query.Where(x => x.Activo);
            query = query.Where(x => x.Jurisdiccion.Any(j => j.Ciudad == ciudad.ToUpper()));


            var queryDto = from unidadAdministrativa in query
                           select new UnidadAdministrativaInfoDto
                           {
                               Id = unidadAdministrativa.Id,
                               Nombre = unidadAdministrativa.Nombre,
                               Siglas = unidadAdministrativa.Siglas,
                               PaisId = unidadAdministrativa.PaisId,
                               Codigo = unidadAdministrativa.Codigo
                           };

            var unidadesAdministrativasInfoDto = await AsyncExecuter.ToListAsync(queryDto);

            return new ListResultDto<UnidadAdministrativaInfoDto>(unidadesAdministrativasInfoDto);
        }

        #endregion Unidad Administrativa Consultas


        public override async Task<UnidadAdministrativaDto> CreateAsync(CrearActualizarUnidadAdministrativaDto input)
        {
            
            await CheckCreatePolicyAsync();

            var entity = await UnidadAdministrativaManager.CrearAsync(
                id: GuidGenerator.Create(),
                name: input.Nombre,
                codigo: input.Codigo,
                administrativeUnitTypeId: input.TipoUnidadAdministrativaId,
                administrativeDependencyId: input.DependenciaAdministrativaId,
                acronym: input.Siglas,
                countryId: input.PaisId,
                regionId: input.RegionId,
                city: input.Ciudad,
                address: input.Direccion,
                zipCode: input.CodigoPostal,
                bankId: input.BancoId,
                currencyId: input.MonedaId,
                operationStartDate: input.FechaInicioOperacion,
                operationEndDate: input.FechaFinOperacion,
                levelId: input.NivelId,
                isActive: input.Activo,
                observations: input.Observaciones,
                tipoCuentaBancariaId: input.TipoCuentaBancariaId,
                titularCuentaBancaria: input.TitularCuentaBancaria,
                numeroCuentaBancaria: input.NumeroCuentaBancaria
                );

           TryToSetTenantId(entity);

           entity = await UnidadAdministrativaManager.EstablecerJurisdiccionAsync(entity,input.Jurisdiccion);

           await Repository.InsertAsync(entity, autoSave: true);

            return await GetAsync(entity.Id);
        }

        public override async Task<UnidadAdministrativaDto> UpdateAsync(Guid id, CrearActualizarUnidadAdministrativaDto input)
        {
          
            await CheckUpdatePolicyAsync();

            var queryable = await Repository.WithDetailsAsync(p => p.Jurisdiccion);
            queryable = queryable.Where(a => a.Id == id);

            var entity = await AsyncExecuter.SingleOrDefaultAsync(queryable);


            if (!entity.Nombre.Equals(input.Nombre, StringComparison.OrdinalIgnoreCase))
            {
                await UnidadAdministrativaManager.CambiarNombreAsync(entity, input.Nombre);
            }

            if (!entity.Siglas.Equals(input.Siglas, StringComparison.OrdinalIgnoreCase))
            {
                await UnidadAdministrativaManager.CambiarSiglasAsync(entity, input.Siglas);
            }

            await MapToEntityAsync(input, entity);

            entity = await UnidadAdministrativaManager.EstablecerJurisdiccionAsync(entity, input.Jurisdiccion); 

            await Repository.UpdateAsync(entity, autoSave: true);

            return await GetAsync(entity.Id);
        }

        public override async Task DeleteAsync(Guid id)
        {
            await CheckDeletePolicyAsync();
            //No Permitido
            throw new UserFriendlyException(string.Format(_localizer["AdministrativeUnit:EliminarBloqueado"]));
        }

        public async Task CambiarEstadoAsync(Guid unidadAdministrativaId, bool activo)
        {
            await CheckUpdatePolicyAsync();

            var admnistrativeUnit = await UnidadAdministrativaManager.CambiarEstadoAsync(unidadAdministrativaId, activo);

            await Repository.UpdateAsync(admnistrativeUnit, autoSave: true);
        }

        #region Funcionarios

        public async Task<PagedResultDto<UnidadAdministrativaFuncionalDto>> ObtenerFuncionalesAsync(Guid unidadAdministrativaId)
        {
            await CheckGetPolicyAsync();

            var queryable = await _administrativeUnitFunctionaryRespository.WithDetailsAsync(f => f.Cargo);
            queryable = queryable.Where(f => f.UnidadAdministrativaId == unidadAdministrativaId);

           
            var totalCount = await AsyncExecuter.CountAsync(queryable);

            var queryableDto = queryable.Select(entity => new UnidadAdministrativaFuncionalDto()
            {
                UsuarioId = entity.UsuarioId,
                Cargo = entity.Cargo.Nombre
            });

            var entityDtos = await AsyncExecuter.ToListAsync(queryableDto);

            return new PagedResultDto<UnidadAdministrativaFuncionalDto>(
                totalCount,
                entityDtos
            );
        }

        public async Task AgregarFuncionalAsync(Guid unidadAdministrativaId, AgregarFuncionarioDto input)
        {
            await CheckUpdatePolicyAsync();

            var admnistrativeUnit = await UnidadAdministrativaManager.AgregarFuncionarioAsync(unidadAdministrativaId, input.UsuarioId, input.CargoId);

            await Repository.UpdateAsync(admnistrativeUnit, autoSave: true);
        }

        public async Task EliminarFuncionalAsync(Guid unidadAdministrativaId, Guid userId)
        {
            await CheckUpdatePolicyAsync();

            var admnistrativeUnit = await UnidadAdministrativaManager.EliminarFuncionarioAsync(unidadAdministrativaId, userId);

            await Repository.UpdateAsync(admnistrativeUnit, autoSave: true);
        }

        #endregion

        #region Servicios
        public async Task<ListResultDto<ServicioDto>> ObtenerServiciosPorTipoDeServicioAsync(Guid administrativeUnitId, string tipoServicioId)
        {
            await CheckGetPolicyAsync();

            var queryable = await _administrativeUnitServiceRespository.GetQueryableAsync();
            var queryableService = await _serviceRepository.GetQueryableAsync();
            queryableService = queryableService.Where(s => s.TipoServicio.Id == tipoServicioId);

            queryable = queryable.Where(p => p.UnidadAdministrativaId == administrativeUnitId);

            var serviciosDto = from entidad in queryable
                               join servicio in queryableService on entidad.ServicioId equals servicio.Id
                               select new ServicioDto()
                               {
                                   Id = entidad.ServicioId,
                                   Nombre = servicio.Nombre,
                                   TipoServicioId = servicio.TipoServicioId,
                                   TipoServicio = servicio.TipoServicio.Nombre,
                                   AtencionPresencial = servicio.AtencionPresencial,
                                   AtencionSemiPresencial = servicio.AtencionSemiPresencial,
                                   AtencionVirtual = servicio.AtencionVirtual,
                                   Activo = servicio.Activo
                               };

            var entityDtos = await AsyncExecuter.ToListAsync(serviciosDto);

            return new ListResultDto<ServicioDto>(entityDtos);
        }

        public async Task<PagedResultDto<UnidadAdministrativaServicioDto>> ObtenerServiciosAsync(Guid unidadAdministrativaId, GetUnidadAdministrativaServicioInput input)
        {

            await CheckGetPolicyAsync();

            var queryable = await _administrativeUnitServiceRespository.GetQueryableAsync();
            var queryableService = await _serviceRepository.GetQueryableAsync();

            queryable = queryable.Where(p => p.UnidadAdministrativaId == unidadAdministrativaId);

            queryable = queryable.WhereIf(
                   input.Activo.HasValue,
                   u =>
                       u.Activo == input.Activo.Value
               );


            var totalCount = await AsyncExecuter.CountAsync(queryable);

            queryable = ApplySortingCustom(queryable, input);
            queryable = ApplyPagingCustom(queryable, input);


            var queryableDto = from entity in queryable
                               join service in queryableService on entity.ServicioId equals service.Id
                               select new UnidadAdministrativaServicioDto()
                               {
                                   UnidadAdministrativaId = entity.UnidadAdministrativaId,
                                   Activo = entity.Activo,
                                   TipoPago = entity.TipoPago.Nombre,
                                   TipoPagoId = entity.TipoPagoId,
                                   ServicioId = entity.ServicioId,
                                   Servicio = service.Nombre
                               }
                    ;

            var entityDtos = await AsyncExecuter.ToListAsync(queryableDto);

            return new PagedResultDto<UnidadAdministrativaServicioDto>(
                totalCount,
                entityDtos
            );

        }

        public async Task<UnidadAdministrativaServicioDto> ObtenerServicioAsync(Guid unidadAdministrativaId, Guid servicioId)
        {

            await CheckGetPolicyAsync();

            var queryable = await _administrativeUnitServiceRespository.GetQueryableAsync();
            var queryableService = await _serviceRepository.GetQueryableAsync();

            queryable = queryable.Where(p => p.UnidadAdministrativaId == unidadAdministrativaId);
            queryable = queryable.Where(p => p.ServicioId == servicioId);

            var queryableDto = from entity in queryable
                               join service in queryableService on entity.ServicioId equals service.Id
                               select new UnidadAdministrativaServicioDto()
                               {
                                   UnidadAdministrativaId = entity.UnidadAdministrativaId,
                                   Activo = entity.Activo,
                                   TipoPago = entity.TipoPago.Nombre,
                                   TipoPagoId = entity.TipoPagoId,
                                   ServicioId = entity.ServicioId,
                                   Servicio = service.Nombre
                               }
                    ;

            var entityDto = await AsyncExecuter.SingleOrDefaultAsync(queryableDto);

            return entityDto;
        }



        public async Task<UnidadAdministrativaServicioDto> AgregarServicioAsync(Guid unidadAdministrativaId, CrearUnidadAdministrativaServicioDto input)
        {
            await CheckUpdatePolicyAsync();

            var admnistrativeUnit = await UnidadAdministrativaManager.AgregarServicioAsync(unidadAdministrativaId, input.ServicioId, input.TipoPagoId, input.Activo);

            await Repository.UpdateAsync(admnistrativeUnit, autoSave: true);


            return await ObtenerServicioAsync(unidadAdministrativaId, input.ServicioId);
        }

        public async Task<UnidadAdministrativaServicioDto> ActualizarServicioAsync(Guid unidadAdministrativaId, Guid servicioId, ActualizarUnidadAdministrativaServicioDto input)
        {

            await CheckUpdatePolicyAsync();

            var queryable = await Repository
                        .WithDetailsAsync(p => p.Servicios)
                        ;

            queryable = queryable.Where(p => p.Id == unidadAdministrativaId);

            var administrativeUnit = await AsyncExecuter.SingleOrDefaultAsync(queryable);
            if (administrativeUnit == null)
            {
                throw new EntityNotFoundException(typeof(Mre.Sb.UnidadAdministrativa.Dominio.UnidadAdministrativa), unidadAdministrativaId);
            }

            var administrativeUnitService = administrativeUnit.Servicios.SingleOrDefault(p => p.ServicioId == servicioId);
            if (administrativeUnitService == null)
            {
                throw new EntityNotFoundException(typeof(Mre.Sb.UnidadAdministrativa.Dominio.UnidadAdministrativaServicio), servicioId);
            }


            administrativeUnitService.Activo = input.Activo;
            administrativeUnitService.TipoPagoId = input.TipoPagoId;

            await Repository.UpdateAsync(administrativeUnit, autoSave: true);


            return await ObtenerServicioAsync(unidadAdministrativaId, servicioId);

        }

        public async Task EliminarServicioAsync(Guid unidadAdministrativaId, Guid servicioId)
        {
            await CheckUpdatePolicyAsync();
           
            var admnistrativeUnit = await UnidadAdministrativaManager.EliminarServicioAsync(unidadAdministrativaId, servicioId);

            await Repository.UpdateAsync(admnistrativeUnit, autoSave: true);

            await CurrentUnitOfWork.SaveChangesAsync();
        }


        public virtual async Task<ListResultDto<ServicioDto>> GetLookupAsync(Guid unidadAdministrativaId)
        {

            await CheckGetPolicyAsync();

            var queryable = await _administrativeUnitServiceRespository.GetQueryableAsync();
            var queryableService = await _serviceRepository.GetQueryableAsync();

            queryable = queryable.Where(p => p.UnidadAdministrativaId == unidadAdministrativaId);

            var queryableAdministrativeUnitService = from entity in queryable
                                                     join service in queryableService on entity.ServicioId equals service.Id
                                                     select service;

            var queriableDto = queryableService.Except(queryableAdministrativeUnitService)
                .Select(entity => new ServicioDto()
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

            var entityDtos = await AsyncExecuter.ToListAsync(queriableDto);

            return new ListResultDto<ServicioDto>(entityDtos);

        }

        public async Task<ListResultDto<ServicioDto>> ObtenerServiciosPorUnidadAdministrativa(Guid unidadAdministrativaId)
        {
            await CheckGetPolicyAsync();

            var queryable = await _administrativeUnitServiceRespository.GetQueryableAsync();
            var queryableService = await _serviceRepository.GetQueryableAsync();

            queryable = queryable.Where(p => p.UnidadAdministrativaId == unidadAdministrativaId);

            var queryableAdministrativeUnitService = from entity in queryable
                                                     join service in queryableService on entity.ServicioId equals service.Id
                                                     select service;

            var queriableDto = queryableAdministrativeUnitService
                .Select(entity => new ServicioDto
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

            var entityDtos = await AsyncExecuter.ToListAsync(queriableDto);

            return new ListResultDto<ServicioDto>(entityDtos);
        }


        #endregion Servicios

        public async Task AssignMissionChiefAsync(Guid unidadAdministrativaId, Guid userId)
        {
            await CheckUpdatePolicyAsync();

            var admnistrativeUnit = await UnidadAdministrativaManager.AssignMissionChiefAsync(unidadAdministrativaId, userId);

            await Repository.UpdateAsync(admnistrativeUnit, autoSave: true);
        }

        #region Signatorios

        public async Task<PagedResultDto<SignatarioDto>> ObtenerSignatariosAsync(Guid unidadAdministrativaId)
        {
            var queryable = await _signerRespository.GetQueryableAsync();

            queryable = queryable.Where(s => s.UnidadAdministrativaId == unidadAdministrativaId);

            var queryableServices = await _serviceRepository.GetQueryableAsync();
 
            var signersDto = from signatario in queryable
                             join servicio in queryableServices on signatario.ServicioId equals servicio.Id
                             select new SignatarioDto()
                             {
                                 UnidadAdministrativaId = signatario.UnidadAdministrativaId,
                                 UsuarioId = signatario.UsuarioId,
                                 ServicioId = servicio.Id,
                                 Servicio = servicio.Nombre,
                                 PorDefecto = signatario.PorDefecto
                             };

            var entityDtos = await AsyncExecuter.ToListAsync(signersDto);  
 
            var totalCount = entityDtos.Count;

            //Firma
            var usuariosIds = entityDtos.Select(x => x.UsuarioId).ToList();

            var usuariosConFirmaIds = await _configuracionSignatarioAppService.PoseenConfiguracionAsync(usuariosIds);
            foreach (var item in entityDtos)
            {
                if (usuariosConFirmaIds.Contains(item.UsuarioId)) {
                    item.PoseeFirmaElectronica = true;
                }
            }


            return new PagedResultDto<SignatarioDto>(
                totalCount,
                entityDtos
            );
        }

        public async Task<ListResultDto<SignatarioDto>> BuscarSignatariosAsync(Guid unidadAdministrativaId,
            ObtenerSignatarioInput input)
        {
            var queryable = await _signerRespository.GetQueryableAsync();

            queryable = queryable.Where(s => s.UnidadAdministrativaId == unidadAdministrativaId);

            var queryableServices = await _serviceRepository.GetQueryableAsync();

            var signatarioConsulta = from signatario in queryable
                                                           join servicio in queryableServices on signatario.ServicioId equals servicio.Id
                                                           select new SignatarioDto()
                                                           {
                                                               UnidadAdministrativaId = signatario.UnidadAdministrativaId,
                                                               UsuarioId = signatario.UsuarioId,
                                                               ServicioId = servicio.Id,
                                                               Servicio = servicio.Nombre,
                                                               PorDefecto = signatario.PorDefecto
                                                           };

            //Filtros Db.
            signatarioConsulta = signatarioConsulta.WhereIf(input.ServicioId.HasValue, x => x.ServicioId == input.ServicioId);
            signatarioConsulta = signatarioConsulta.WhereIf(input.UsuarioId.HasValue, x => x.UsuarioId == input.UsuarioId);
  
            var entityDtos = await AsyncExecuter.ToListAsync(signatarioConsulta);

            var signatarioConsultaPorDefecto = from signatario in queryable
                                     join servicio in queryableServices on signatario.ServicioId equals servicio.Id
                                     where signatario.PorDefecto
                                     select new SignatarioDto()
                                     {
                                         UnidadAdministrativaId = signatario.UnidadAdministrativaId,
                                         UsuarioId = signatario.UsuarioId,
                                         ServicioId = servicio.Id,
                                         Servicio = servicio.Nombre,
                                         PorDefecto = signatario.PorDefecto
                                     };

            var signatarioPorDefectoDto = await AsyncExecuter.SingleOrDefaultAsync(signatarioConsultaPorDefecto);
            if (signatarioPorDefectoDto != null && !entityDtos.Any( x => x.UnidadAdministrativaId == signatarioPorDefectoDto.UnidadAdministrativaId 
                 && x.ServicioId == signatarioPorDefectoDto.ServicioId 
                 && x.UsuarioId == signatarioPorDefectoDto.UsuarioId)) {

                //Agregar si existe PorDefecto y no existe en la lista ya...              
                entityDtos.Add(signatarioPorDefectoDto);
            }

            var resultado = new List<SignatarioDto>();

            
            //Agregar informacion firma
            var usuariosIds = entityDtos.Select(x => x.UsuarioId).ToList();

            var usuariosConFirmaIds = await _configuracionSignatarioAppService.PoseenConfiguracionAsync(usuariosIds);
            foreach (var item in entityDtos)
            {
                if (usuariosConFirmaIds.Contains(item.UsuarioId))
                {
                    item.PoseeFirmaElectronica = true;
                }
            }

            //Filtrar Firma
            if (input.PoseeFirmaElectronica.HasValue && input.PoseeFirmaElectronica.Value)
            {
                foreach (var item in entityDtos)
                {
                    if (item.PoseeFirmaElectronica)
                    {
                        resultado.Add(item);
                    }
                }
            }
            else if (input.PoseeFirmaElectronica.HasValue && !input.PoseeFirmaElectronica.Value) {
                foreach (var item in entityDtos)
                {
                    if (!item.PoseeFirmaElectronica)
                    {
                        resultado.Add(item);
                    }
                }
            }
            else
            {
                resultado.AddRange(entityDtos);
            }
          
            return new ListResultDto<SignatarioDto>(
                resultado
            );
        }


        public async Task AgregarSignatarioAsync(Guid unidadAdministrativaId, CrearSignatarioDto input)
        {
            await CheckUpdatePolicyAsync();

            var admnistrativeUnit = await UnidadAdministrativaManager.AgregarSignatarioAsync(unidadAdministrativaId, input.UsuarioId, input.ServicioId, input.PorDefecto);

            await Repository.UpdateAsync(admnistrativeUnit, autoSave: true);
        }

        public async Task EliminarSignatarioAsync(Guid unidadAdministrativaId, Guid userId, Guid servicioId)
        {
            await CheckUpdatePolicyAsync();

            var admnistrativeUnit = await UnidadAdministrativaManager.EliminarSignatarioAsync(unidadAdministrativaId, userId, servicioId);

            await Repository.UpdateAsync(admnistrativeUnit, autoSave: true);
        }

        #endregion



        #region Method Soport

        protected virtual IQueryable<TEntity> ApplySortingCustom<TEntity>(IQueryable<TEntity> query, PagedAndSortedResultRequestDto input)
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
                return ApplyDefaultSortingCustom(query);
            }

            //No sorting
            return query;
        }

        protected virtual IQueryable<TEntity> ApplyDefaultSortingCustom<TEntity>(IQueryable<TEntity> query)
        {
            if (typeof(TEntity).IsAssignableTo<IHasCreationTime>())
            {
                return query.OrderByDescending(e => ((IHasCreationTime)e).CreationTime);
            }



            throw new AbpException("No sorting specified but this query requires sorting. Override the ApplyDefaultSorting method for your application service derived from AbstractKeyReadOnlyAppService!");
        }

        protected virtual IQueryable<TEntity> ApplyPagingCustom<TEntity>(IQueryable<TEntity> query, PagedAndSortedResultRequestDto input)
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

      


        private void AddDataGeographical(UnidadAdministrativaDto data)
        {
            AddDataGeographical(new List<UnidadAdministrativaDto> { data });

        }

        private void AddDataGeographical(List<UnidadAdministrativaDto> data)
        {
            foreach (var item in data)
            {

                //item.PaisId
                var country = _countryData.GetCountry(item.PaisId);
                if (country != null)
                {

                    item.Pais = country?.Name;

                    //TODO: Mejorar establecer un metodo para obtener la region directamente
                    var region = _countryData.GetRegionByCountryCode(country.Code).SingleOrDefault(r => r.Code == item.RegionId);
                    item.Region = region?.Name;

                    //TODO: #issues/39 Unidad administrativa requiere Cantones ???
                    //SubRegiones son cantones
                }
            }
        }

        #endregion

    }


}
