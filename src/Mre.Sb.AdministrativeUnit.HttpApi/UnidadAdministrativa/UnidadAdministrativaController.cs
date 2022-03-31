using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Microsoft.Extensions.Options;
using Mre.Sb.AdministrativeUnit;
using Mre.Sb.AdministrativeUnit.HttpApiClient.Tramite;
using Mre.Sb.AdministrativeUnit.Localization;
using Mre.Sb.AdministrativeUnit.Permissions;
using Mre.Sb.UnidadAdministrativa.Servicio;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Tracing;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/unidad-administrativa")]
    [Authorize]
    public class UnidadAdministrativaController : AdministrativeUnitBaseController, IUnidadAdministrativaAppService
    {
        private readonly ITramiteClient tramiteClient;
        private readonly ICorrelationIdProvider correlationIdProvider;
        private readonly ITokenAcceso tokenAcceso;
        private readonly AbpCorrelationIdOptions abpCorrelationIdOptions;
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;

        public IUnidadAdministrativaAppService AdministrativeUnitAppService { get; }

        public UnidadAdministrativaController(
            IUnidadAdministrativaAppService administrativeUnitAppService,
            ITramiteClient tramiteClient,
            ICorrelationIdProvider correlationIdProvider,
            IOptions<AbpCorrelationIdOptions> abpCorrelationIdOptions,
            ITokenAcceso tokenAcceso,
            IStringLocalizer<AdministrativeUnitResource> localizer)
        {
            AdministrativeUnitAppService = administrativeUnitAppService;
            this.tramiteClient = tramiteClient;
            this.correlationIdProvider = correlationIdProvider;
            this.tokenAcceso = tokenAcceso;
            this.abpCorrelationIdOptions = abpCorrelationIdOptions.Value;
            this.localizer = localizer;
        }

        [HttpPost]
        public Task<UnidadAdministrativaDto> CreateAsync(CrearActualizarUnidadAdministrativaDto input)
        {
            return AdministrativeUnitAppService.CreateAsync(input);
        }

        [HttpGet]
        public Task<PagedResultDto<UnidadAdministrativaDto>> GetListAsync(GetUnidadAdministrativaInput input)
        {
            return AdministrativeUnitAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("{id}")]
        public Task<UnidadAdministrativaDto> GetAsync(Guid id)
        {
            return AdministrativeUnitAppService.GetAsync(id);
        }

        [HttpGet]
        [Route("obtener-codigo/{codigo}")]
        public Task<UnidadAdministrativaDto> ObtenerPorCodigoAsync(string codigo)
        {
            return AdministrativeUnitAppService.ObtenerPorCodigoAsync(codigo);
        }

        [HttpGet]
        [Route("lookup")]
        public virtual Task<ListResultDto<UnidadAdministrativaInfoDto>> GetLookupAdministrativeUnitAsync()
        {
            return AdministrativeUnitAppService.GetLookupAdministrativeUnitAsync();
        }

        [HttpGet("servicio/{servicioId}")]
        public async Task<ListResultDto<UnidadAdministrativaInfoDto>> ObtenerUnidadAdministrativaPorServicioAsync(Guid servicioId)
        {
            return await AdministrativeUnitAppService.ObtenerUnidadAdministrativaPorServicioAsync(servicioId);
        }

        [HttpGet("listaIds")]
        public async Task<ListResultDto<UnidadAdministrativaInfoDto>> ObtenerPorListaIds(List<Guid> ids)
        {
            return await AdministrativeUnitAppService.ObtenerPorListaIds(ids);
        }

        [HttpGet]
        [Route("pais/{codigoPais}")]
        public Task<ListResultDto<UnidadAdministrativaInfoDto>> ObtenerUnidadAdminsitrativaPorPaisAsync(string codigoPais)
        {
            return AdministrativeUnitAppService.ObtenerUnidadAdminsitrativaPorPaisAsync(codigoPais);
        }

        [HttpGet]
        [Route("servicio/{servicioId}/pais/{codigoPais}")]
        public Task<ListResultDto<UnidadAdministrativaInfoDto>> ObtenerUnidadAdministrativaPorServicioPaisAsync(Guid servicioId, string codigoPais)
        {
            return AdministrativeUnitAppService.ObtenerUnidadAdministrativaPorServicioPaisAsync(servicioId, codigoPais);
        }


        [HttpGet]
        [Route("jurisdiccion/{ciudad}")]
        public Task<ListResultDto<UnidadAdministrativaInfoDto>> ObtenerUnidadAdministrativaPorCiudadJurisdiccionAsync(string ciudad)
        {
            return AdministrativeUnitAppService.ObtenerUnidadAdministrativaPorCiudadJurisdiccionAsync(ciudad);
        }


        [HttpGet]
        [Route("{administrativeUnitId}/tiposervicio/{tipoServicioId}")]
        public Task<ListResultDto<ServicioDto>> ObtenerServiciosPorTipoDeServicioAsync(Guid administrativeUnitId, string tipoServicioId)
        {
            return AdministrativeUnitAppService.ObtenerServiciosPorTipoDeServicioAsync(administrativeUnitId, tipoServicioId);
        }

        [HttpPut]
        [Route("{id}")]
        public Task<UnidadAdministrativaDto> UpdateAsync(Guid id, CrearActualizarUnidadAdministrativaDto input)
        {
            return AdministrativeUnitAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public Task DeleteAsync(Guid id)
        {
            return AdministrativeUnitAppService.DeleteAsync(id);
        }

        [HttpPatch]
        [Route("{unidadAdministrativaId}/state/{isActive}")]
        public Task CambiarEstadoAsync(Guid unidadAdministrativaId, bool isActive)
        {
            return AdministrativeUnitAppService.CambiarEstadoAsync(unidadAdministrativaId, isActive);
        }

        #region funcionario

        [HttpPost]
        [Route("{unidadAdministrativaId}/funcionario")]
        public Task AgregarFuncionalAsync(Guid unidadAdministrativaId, AgregarFuncionarioDto input)
        {
            return AdministrativeUnitAppService.AgregarFuncionalAsync(unidadAdministrativaId, input);
        }

        [HttpGet]
        [Route("{unidadAdministrativaId}/funcionario")]
        public Task<PagedResultDto<UnidadAdministrativaFuncionalDto>> ObtenerFuncionalesAsync(Guid unidadAdministrativaId)
        {
            return AdministrativeUnitAppService.ObtenerFuncionalesAsync(unidadAdministrativaId);
        }


        [HttpDelete]
        [Route("{unidadAdministrativaId}/funcionario/{userId}")]
        public Task EliminarFuncionalAsync(Guid unidadAdministrativaId, Guid userId)
        {
            return AdministrativeUnitAppService.EliminarFuncionalAsync(unidadAdministrativaId, userId);
        }

        #endregion funcionario


        [HttpPut]
        [Route("{unidadAdministrativaId}/{userId}")]
        public Task AssignMissionChiefAsync(Guid unidadAdministrativaId, Guid userId)
        {
            return AdministrativeUnitAppService.AssignMissionChiefAsync(unidadAdministrativaId, userId);
        }

      
        #region Servicio

        [HttpGet]
        [Route("{unidadAdministrativaId}/servicio")]
        public Task<PagedResultDto<UnidadAdministrativaServicioDto>> ObtenerServiciosAsync(Guid unidadAdministrativaId, GetUnidadAdministrativaServicioInput input)
        {
            return AdministrativeUnitAppService.ObtenerServiciosAsync(unidadAdministrativaId, input);
        }

        [HttpGet]
        [Route("{unidadAdministrativaId}/servicio/{servicioId}")]
        public Task<UnidadAdministrativaServicioDto> ObtenerServicioAsync(Guid unidadAdministrativaId, Guid servicioId)
        {
            return AdministrativeUnitAppService.ObtenerServicioAsync(unidadAdministrativaId, servicioId);
        }
         

        [HttpGet]
        [Route("{unidadAdministrativaId}/servicio-todo")]
        public async Task<ListResultDto<ServicioDto>> ObtenerServiciosPorUnidadAdministrativa(Guid unidadAdministrativaId)
        {
            return await AdministrativeUnitAppService.ObtenerServiciosPorUnidadAdministrativa(unidadAdministrativaId);
        }

        [HttpGet]
        [Route("{unidadAdministrativaId}/route")]
        public Task<ListResultDto<ServicioDto>> GetLookupAsync(Guid unidadAdministrativaId)
        {
            return AdministrativeUnitAppService.GetLookupAsync(unidadAdministrativaId);
        }

        [HttpPost]
        [Route("{unidadAdministrativaId}/servicio")]
        public Task<UnidadAdministrativaServicioDto> AgregarServicioAsync(Guid unidadAdministrativaId, CrearUnidadAdministrativaServicioDto input)
        {
            return AdministrativeUnitAppService.AgregarServicioAsync(unidadAdministrativaId, input);
        }

        [HttpPut]
        [Route("{unidadAdministrativaId}/servicio/{servicioId}")]
        public Task<UnidadAdministrativaServicioDto> ActualizarServicioAsync(Guid unidadAdministrativaId, Guid servicioId, ActualizarUnidadAdministrativaServicioDto input)
        {
            return AdministrativeUnitAppService.ActualizarServicioAsync(unidadAdministrativaId, servicioId, input);
        }

        [HttpDelete]
        [Route("{unidadAdministrativaId}/servicio/{servicioId}")]
        [Authorize(AdministrativeUnitPermissions.AdministrativeUnit.Update)]
        public async Task EliminarServicioAsync(Guid unidadAdministrativaId, Guid servicioId)
        {

            string accessToken = await tokenAcceso.ObtenerAsync();

            //1. Check
            var tramitesActivos = await tramiteClient.ExistenTramitesPorServicioAsync(servicioId);
            if (tramitesActivos.Activo)
            {
                throw new UserFriendlyException(string.Format(localizer["AdministrativeUnit:ServiceHasActiveProcess"]));
            }

            //2. Delete..
            await AdministrativeUnitAppService.EliminarServicioAsync(unidadAdministrativaId, servicioId);
        }

       

        #endregion Servicio

        #region Signatarios

        [HttpGet]
        [Route("{unidadAdministrativaId}/signatario")]
        public Task<PagedResultDto<SignatarioDto>> ObtenerSignatariosAsync(Guid unidadAdministrativaId)
        {
            return AdministrativeUnitAppService.ObtenerSignatariosAsync(unidadAdministrativaId);
        }

        [HttpGet]
        [Route("{unidadAdministrativaId}/signatario/buscar")]
        public Task<ListResultDto<SignatarioDto>> BuscarSignatariosAsync(Guid unidadAdministrativaId, ObtenerSignatarioInput input)
        {
            return AdministrativeUnitAppService.BuscarSignatariosAsync(unidadAdministrativaId, input);
        }
      
        [HttpPost]
        [Route("{unidadAdministrativaId}/signatario")]
        public Task AgregarSignatarioAsync(Guid unidadAdministrativaId, CrearSignatarioDto input)
        {
            return AdministrativeUnitAppService.AgregarSignatarioAsync(unidadAdministrativaId, input);
        }

        [HttpDelete]
        [Route("{unidadAdministrativaId}/signatario/usuario/{userId}/servicio/{servicioId}")]
        public Task EliminarSignatarioAsync(Guid unidadAdministrativaId, Guid userId, Guid servicioId)
        {
            return AdministrativeUnitAppService.EliminarSignatarioAsync(unidadAdministrativaId, userId, servicioId);
        }


        #endregion
    }

}
