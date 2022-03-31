using Microsoft.Extensions.Localization;
using Mre.Sb.AdministrativeUnit.Localization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Domain.Entities;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Domain.Services;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    public class UnidadAdministrativaManager : DomainService
    {
        

        private readonly IRepository<Dominio.UnidadAdministrativa, Guid> repository;
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;
        private readonly IRepository<UnidadAdministrativaServicio> administrativeUnitServiceRespository;
        private readonly IRepository<UnidadAdministrativaFuncionario> administrativeUnitFunctionaryRespository;
        private readonly IRepository<Signatario> administrativeUnitSignerRespository;
        private readonly ConfiguracionSignatarioManager configuracionSignatarioManager;

        public UnidadAdministrativaManager(
            IRepository<Dominio.UnidadAdministrativa, Guid> repository, 
            IRepository<Dominio.UnidadAdministrativaServicio> administrativeUnitServiceRespository,
            IRepository<UnidadAdministrativaFuncionario> administrativeUnitFunctionaryRespository,
            IRepository<Signatario> administrativeUnitSignerRespository,
            ConfiguracionSignatarioManager configuracionSignatarioManager,
            IStringLocalizer<AdministrativeUnitResource> localizer)
        {
            this.repository = repository;
            this.administrativeUnitServiceRespository = administrativeUnitServiceRespository;
            this.localizer = localizer;
            this.administrativeUnitFunctionaryRespository = administrativeUnitFunctionaryRespository;
            this.administrativeUnitSignerRespository = administrativeUnitSignerRespository;
            this.configuracionSignatarioManager = configuracionSignatarioManager;
        }

        public virtual async Task<UnidadAdministrativa> CrearAsync(Guid id, string name, string codigo, string administrativeUnitTypeId, Guid? administrativeDependencyId, string acronym, string countryId, string regionId, string city, string address, string zipCode, string bankId, string currencyId, DateTime? operationStartDate, DateTime? operationEndDate,  string levelId,  string tipoCuentaBancariaId, string titularCuentaBancaria, string numeroCuentaBancaria, bool isActive = true, string observations = null)
        {

            //1. Check if exist
            var queryable = await repository.GetQueryableAsync();
            var existeNombre = queryable.Any(e => e.Nombre.ToUpper() == name);

            if (existeNombre)
            {
                throw new UserFriendlyException(string.Format(localizer["AdministrativeUnit:NameExist"], name));
            }
            var existeSiglas = queryable.Any(e => e.Siglas.ToUpper() == acronym);
            if (existeSiglas)
            {
                throw new UserFriendlyException(string.Format(localizer["AdministrativeUnit:AcronymExist"], acronym));
            }

            var existeCodigo = queryable.Any(e => e.Codigo.ToUpper() == codigo);
            if (existeCodigo)
            {
                throw new UserFriendlyException(string.Format(localizer["AdministrativeUnit:CodigoExiste"], codigo));
            }

            var entity = new UnidadAdministrativa(id: id, name: name, codigo: codigo, administrativeUnitTypeId: administrativeUnitTypeId, administrativeDependencyId: administrativeDependencyId, acronym: acronym, countryId: countryId, regionId: regionId, city:city, address: address, zipCode: zipCode, bankId: bankId, currencyId: currencyId, operationStartDate: operationStartDate, operationEndDate: operationEndDate, levelId: levelId, isActive : isActive, observations: observations,  tipoCuentaBancariaId: tipoCuentaBancariaId, titularCuentaBancaria: titularCuentaBancaria, numeroCuentaBancaria: numeroCuentaBancaria
                );



            return entity;
        }

        public async Task CambiarNombreAsync(
               UnidadAdministrativa administrativeUnit,
               string newName)
        {
            Check.NotNull(administrativeUnit, nameof(administrativeUnit));
            Check.NotNullOrWhiteSpace(newName, nameof(newName));

            var queryable = await repository.GetQueryableAsync();
            var existing = queryable.Any(e => e.Nombre.ToUpper() == newName.ToUpper() &&
                    e.Id != administrativeUnit.Id);

            if (existing)
            {
                throw new UserFriendlyException(string.Format(localizer["AdministrativeUnit:NameExist"], newName));
            }

            administrativeUnit.CambiarNombre(newName);
        }


        public async Task CambiarSiglasAsync(
              UnidadAdministrativa administrativeUnit,
              string nuevaSiglas)
        {
            Check.NotNull(administrativeUnit, nameof(administrativeUnit));
            Check.NotNullOrWhiteSpace(nuevaSiglas, nameof(nuevaSiglas));

            var queryable = await repository.GetQueryableAsync();
            var existing = queryable.Any(e => e.Siglas.ToUpper() == nuevaSiglas.ToUpper() &&
                    e.Id != administrativeUnit.Id);

            if (existing)
            {
                throw new UserFriendlyException(string.Format(localizer["AdministrativeUnit:AcronymExist"], nuevaSiglas));
            }

            administrativeUnit.CambiarSigla(nuevaSiglas);
        }

        public async Task CambiarCodigoAsync(
              UnidadAdministrativa administrativeUnit,
              string nuevoCodigo)
        {
            Check.NotNull(administrativeUnit, nameof(administrativeUnit));
            Check.NotNullOrWhiteSpace(nuevoCodigo, nameof(nuevoCodigo));

            var queryable = await repository.GetQueryableAsync();
            var existing = queryable.Any(e => e.Codigo.ToUpper() == nuevoCodigo.ToUpper() &&
                    e.Id != administrativeUnit.Id);

            if (existing)
            {
                throw new UserFriendlyException(string.Format(localizer["AdministrativeUnit:CodigoExiste"], nuevoCodigo));
            }

            administrativeUnit.CambiarCodigo(nuevoCodigo);
        }


        public async Task<UnidadAdministrativa> CambiarEstadoAsync(Guid id, bool isActive)
        {
            Check.NotNull(id, nameof(id));

            var administrativeUnit = await repository.GetAsync(id);

            //TODO: Validar tramites activos. Consultar al microservicio de tramites
            var existing = false;

            if (existing)
            {
                throw new AbpException(string.Format(localizer["AdministrativeUnit:ThereAreActiveProcess"], administrativeUnit.Nombre));
            }

            if (administrativeUnit.Activo == isActive)
            {
                throw new AbpException(string.Format(localizer["AdministrativeUnit:StateIsFalse"], isActive));
            }

            administrativeUnit.ChangeState(isActive);

            return administrativeUnit;
        }

        public async Task<UnidadAdministrativa> AgregarFuncionarioAsync(Guid unidadAdministrativaId, Guid usuarioId, string positionId)
        {
            Check.NotNull(unidadAdministrativaId, nameof(unidadAdministrativaId));
            Check.NotNull(usuarioId, nameof(usuarioId));

            var consulta = await repository.WithDetailsAsync(x => x.Funcionarios);
            consulta = consulta.Where(au => au.Id == unidadAdministrativaId);

            var administrativeUnit = await AsyncExecuter.SingleOrDefaultAsync(consulta);
            if (administrativeUnit == null)
            {
                throw new EntityNotFoundException(typeof(Mre.Sb.UnidadAdministrativa.Dominio.UnidadAdministrativa), unidadAdministrativaId);
            }

            var exist = await ExisteFuncionarioAsync(usuarioId);
            if (exist)
            {
                throw new UserFriendlyException(string.Format(localizer["AdministrativeUnit:FunctionaryExist"]));
            }

            administrativeUnit.AgregarFuncionario(usuarioId, positionId);

            return administrativeUnit;
        }

        public virtual async Task<bool> ExisteFuncionarioAsync(Guid userId)
        {
            Check.NotNull(userId, nameof(userId));

            var queryable = await administrativeUnitFunctionaryRespository.GetQueryableAsync();
            queryable = queryable.Where(p => p.UsuarioId == userId);

            return queryable.Any();
        }

        public async Task<UnidadAdministrativa> EliminarFuncionarioAsync(Guid unidadAdministrativaId, Guid userId)
        {
            Check.NotNull(unidadAdministrativaId, nameof(unidadAdministrativaId));
            Check.NotNull(userId, nameof(userId));

            var queryableFunctionaries = await administrativeUnitFunctionaryRespository.GetQueryableAsync();

            var queryFunctionaries = queryableFunctionaries.Where(f => f.UnidadAdministrativaId == unidadAdministrativaId && f.UsuarioId == userId);

            var administrativeUnitFunctionary = await AsyncExecuter.FirstOrDefaultAsync(queryFunctionaries);

            if (administrativeUnitFunctionary == null)
            {
                throw new EntityNotFoundException(typeof(UnidadAdministrativaFuncionario), unidadAdministrativaId);
            }

            var esSignatario = await EsSignatario(userId, unidadAdministrativaId);

            if (esSignatario)
            {
                throw new UserFriendlyException(string.Format(localizer["AdministrativeUnit:FunctionaryIsSigner"]));
            }

            var queryable = await repository.WithDetailsAsync(x => x.Funcionarios);
            var query = queryable.Where(ua => ua.Id == unidadAdministrativaId);

           
            var administrativeUnit = await AsyncExecuter.SingleOrDefaultAsync(query);

            if (administrativeUnit.JefeMisionId != null)
            {
                if (administrativeUnit.JefeMisionId == userId)
                {
                    throw new UserFriendlyException(string.Format(localizer["AdministrativeUnit:FunctionaryIsSigner"]));
                }
            }

            administrativeUnit.EliminarFuncionario(userId);

            return administrativeUnit;
        }

       

        public async Task<UnidadAdministrativa> AssignMissionChiefAsync(Guid id, Guid userId)
        {
            Check.NotNull(id, nameof(id));
            Check.NotNull(userId, nameof(userId));

            var queryable = await repository.GetQueryableAsync();

            queryable = queryable.Where(ua => ua.Id == id);

            var administrativeUnit = await AsyncExecuter.FirstOrDefaultAsync(queryable);

            if (administrativeUnit.JefeMisionId != null)
            {
                if (administrativeUnit.JefeMisionId == userId)
                {
                    throw new UserFriendlyException(string.Format(localizer["AdministrativeUnit:MisionChiefAssigned"]));
                }
            }

            administrativeUnit.AddMissionChief(userId);

            return administrativeUnit;
        }

        #region Signatarios

        public async Task<UnidadAdministrativa> AgregarSignatarioAsync(Guid administrativeUnitId, Guid userId, Guid serviceId, bool porDefecto = false)
        {
            Check.NotNull(administrativeUnitId, nameof(administrativeUnitId));
            Check.NotNull(userId, nameof(userId));
            Check.NotNull(serviceId, nameof(serviceId));

            var isAssigned = await SignatarioAsignado(administrativeUnitId, userId, serviceId);

            if (isAssigned)
            {
                throw new UserFriendlyException(string.Format(localizer["AdministrativeUnit:SignerAlreadyAssigned"]));
            }

            var queryable = await repository.WithDetailsAsync(x => x.Signatarios);

            var query = queryable.Where(au => au.Id == administrativeUnitId);

            var administrativeUnit = await AsyncExecuter.SingleOrDefaultAsync(query);
           
            if (administrativeUnit == null)
            {
                throw new EntityNotFoundException(typeof(UnidadAdministrativa), administrativeUnitId);
            }

            if (porDefecto) {
                var existeOtroDefecto = administrativeUnit.Signatarios.Any(x => x.PorDefecto);
                if (existeOtroDefecto)
                {
                    throw new UserFriendlyException(string.Format(localizer["Signer:ExisteOtroSignatarioPorDefecto"]));
                }
            }
          

            administrativeUnit.AgregarSignatario(userId, serviceId, porDefecto);

            return administrativeUnit;
        }

        public virtual async Task<bool> SignatarioAsignado(Guid administrativeUnitId, Guid userId, Guid serviceId)
        {
            Check.NotNull(administrativeUnitId, nameof(administrativeUnitId));
            Check.NotNull(userId, nameof(userId));

            var queryable = await administrativeUnitSignerRespository.GetQueryableAsync();
            queryable = queryable.Where(p => p.UnidadAdministrativaId == administrativeUnitId);
            queryable = queryable.Where(p => p.UsuarioId == userId);
            queryable = queryable.Where(p => p.ServicioId == serviceId);

            return queryable.Any();
        }

        public async Task<UnidadAdministrativa> EliminarSignatarioAsync(Guid id, Guid userId, Guid serviceId)
        {
            Check.NotNull(id, nameof(id));
            Check.NotNull(userId, nameof(userId));
            Check.NotNull(serviceId, nameof(serviceId));

            var queryableSigners = await administrativeUnitSignerRespository.GetQueryableAsync();

            queryableSigners = queryableSigners.Where(s => s.UnidadAdministrativaId == id && s.ServicioId == serviceId && s.UsuarioId == userId);

            var administrativeUnitService = await AsyncExecuter.SingleOrDefaultAsync(queryableSigners);

            if (administrativeUnitService == null)
            {
                throw new EntityNotFoundException(typeof(UnidadAdministrativaFuncionario), id);
            }

            var usuarioPoseeConfiguracionFirmaElectronica = await configuracionSignatarioManager.PoseenConfiguracionAsync(userId);
            if (usuarioPoseeConfiguracionFirmaElectronica)
            {
                throw new UserFriendlyException(string.Format(localizer["Signer:EliminarFirmaElectronicaNoPermitida"]));
            }


            var queryable = await repository.WithDetailsAsync(x => x.Signatarios);
            var query = queryable.Where(ua => ua.Id == id);

            var administrativeUnit = await AsyncExecuter.SingleOrDefaultAsync(query);

            administrativeUnit.EliminarSignatario(userId, serviceId);

            return administrativeUnit;
        }

        public virtual async Task<bool> EsSignatario(Guid userId, Guid? administrativeUnitId=null)
        {
            Check.NotNull(userId, nameof(userId));

            var queryable = await administrativeUnitSignerRespository.GetQueryableAsync();
            queryable = queryable.Where(p => p.UsuarioId == userId);

            queryable = queryable.WhereIf(
                   administrativeUnitId.HasValue,
                   p => p.UnidadAdministrativaId == administrativeUnitId
               ); 

            return queryable.Any();
        }


        ///// <summary>
        ///// Obtener la unidad administrativa, en la cual 
        ///// el usuario se encuentra asociado como signatario.
        ///// </summary>
        ///// <param name="usuarioId">signatario</param>
        ///// <returns></returns>
        //public async Task<UnidadAdministrativa> ObtenerUnidadAdministrativaAsync(Guid usuarioId) {

        //    Check.NotNull(usuarioId, nameof(usuarioId));

        //    var unidadAdministrativa = await repository.ObtenerUnidadAdministrativaAsync(usuarioId);

        //    return unidadAdministrativa; 
        //}



        #endregion

        #region Services

        public async Task<UnidadAdministrativa> AgregarServicioAsync(Guid id, Guid serviceId, string paymentType,bool isActive)
        {
            Check.NotNull(id, nameof(id));
            Check.NotNull(serviceId, nameof(serviceId));

            var queryable = await repository.GetQueryableAsync();
            var query = queryable.Where(au => au.Id == id);

            var administrativeUnit =  await AsyncExecuter.SingleOrDefaultAsync(query); 
            if (administrativeUnit == null)
            {
                throw new EntityNotFoundException(typeof(Mre.Sb.UnidadAdministrativa.Dominio.UnidadAdministrativa), id);
            }  

            //Check
            var exist = await ExisteServicioAsync(id,serviceId);
            if (exist)
            {
                throw new UserFriendlyException(string.Format(localizer["AdministrativeUnit:ServiceExist"]));
            }
 
            administrativeUnit.AgregarServicio(serviceId, paymentType,isActive);

            return administrativeUnit;
        }

        public async Task<UnidadAdministrativa> EliminarServicioAsync(Guid id, Guid serviceId)
        {
            Check.NotNull(id, nameof(id));
            Check.NotNull(serviceId, nameof(serviceId));

            var queryableServices = await administrativeUnitServiceRespository.GetQueryableAsync();

            queryableServices = queryableServices.Where(s => s.UnidadAdministrativaId == id && s.ServicioId == serviceId);

            var administrativeUnitService = await AsyncExecuter.FirstOrDefaultAsync(queryableServices);

            if (administrativeUnitService == null)
            {
                throw new EntityNotFoundException(typeof(UnidadAdministrativaFuncionario), id);
            }

            var queryable = await repository.WithDetailsAsync(x => x.Servicios);
            var query = queryable.Where(ua => ua.Id == id);

            var administrativeUnit = await AsyncExecuter.SingleOrDefaultAsync(query);

            administrativeUnit.EliminarServicio(serviceId);

            return administrativeUnit;
        }

        public virtual async Task<bool> ExisteServicioAsync(Guid administrativeUnitId, Guid serviceId)
        {
            Check.NotNull(administrativeUnitId, nameof(administrativeUnitId));
            Check.NotNull(serviceId, nameof(serviceId));

            var queryable = await administrativeUnitServiceRespository.GetQueryableAsync();
            queryable = queryable.Where(p => p.UnidadAdministrativaId == administrativeUnitId);
            queryable = queryable.Where(p => p.ServicioId == serviceId);

            return queryable.Any();
        }


        #endregion Services   

        #region Jurisdiccion
        public async Task<UnidadAdministrativa> EstablecerJurisdiccionAsync(UnidadAdministrativa unidadAdministrativa, IEnumerable<string> ciudadesJurisdiccion)
        {
            Check.NotNull(unidadAdministrativa, nameof(unidadAdministrativa));
            Check.NotNull(ciudadesJurisdiccion, nameof(ciudadesJurisdiccion));

            var ciudadesJurisdiccionActuales = unidadAdministrativa.Jurisdiccion.Select(j => j.Ciudad);

            if (ciudadesJurisdiccion.Any())
            {
                unidadAdministrativa.EliminarJurisdiccion(ciudadesJurisdiccionActuales.Except(ciudadesJurisdiccion).Distinct());
                unidadAdministrativa.AgregarJurisdiccion(ciudadesJurisdiccion.Except(ciudadesJurisdiccionActuales).Distinct());
            }
            else {
                //Eliminar todos
                unidadAdministrativa.EliminarJurisdiccion(ciudadesJurisdiccionActuales.Distinct());
            }

            return await Task.FromResult(unidadAdministrativa);
        }


        #endregion Services   


        
    }

}
