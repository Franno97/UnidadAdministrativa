using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mre.Sb.AdministrativeUnit.Permissions;
using System;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{


    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/convenio")]
    [Authorize]
    public class ConvenioController : AdministrativeUnitBaseController, IConvenioAppService
    {
        public IConvenioAppService ConvenioAppService { get; }


        public ConvenioController(IConvenioAppService agreementAppService)
        {
            ConvenioAppService = agreementAppService;
        }


        [HttpGet]
        public async Task<PagedResultDto<ConvenioDto>> GetListAsync(GetConvenioInput input)
        {
            return await ConvenioAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("lookup")]
        public async Task<ListResultDto<ConvenioLookupDto>> GetLookupAsync()
        {
            return await ConvenioAppService.GetLookupAsync();
        }

        [HttpGet]
        [Route("{id}")]
        public async Task<ConvenioDto> GetAsync(Guid id)
        {
            return await ConvenioAppService.GetAsync(id);
        }



        [HttpPost]
        public async Task<ConvenioDto> CreateAsync(CrearActualizarConvenioDto input)
        {
            return await ConvenioAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public async Task<ConvenioDto> UpdateAsync(Guid id, CrearActualizarConvenioDto input)
        {
            return await ConvenioAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public async Task DeleteAsync(Guid id)
        {
            await ConvenioAppService.DeleteAsync(id);
        }


        #region Exoneration

        [HttpGet]
        [Route("{agreementId}/exoneration")]
        public async Task<PagedResultDto<ExonerationDto>> GetExonerationsAsync(Guid agreementId, GetExoneracionInput input)
        {
            return await ConvenioAppService.GetExonerationsAsync(agreementId, input);
        }

        [HttpGet]
        [Route("{agreementId}/exoneration/{serviceId}")]
        public async Task<ExonerationDto> GetExonerationAsync(Guid agreementId, Guid serviceId)
        {
            return await ConvenioAppService .GetExonerationAsync(agreementId, serviceId);
        }


        [HttpPost]
        [Route("{agreementId}/exoneration")]
        public async Task<ExonerationDto> AddExonerationAsync(Guid agreementId, CrearExoneracionDto input)
        {
            return await ConvenioAppService.AddExonerationAsync(agreementId, input);
        }

        [HttpPut]
        [Route("{agreementId}/exoneration/{serviceId}")]
        public async Task<ExonerationDto> UpdateExonerationAsync(Guid agreementId, Guid serviceId, ActualizarExoneracionDto input)
        {
            return await ConvenioAppService.UpdateExonerationAsync(agreementId, serviceId, input);
        }

        [HttpDelete]
        [Route("{agreementId}/exoneration/{serviceId}")]
        //[Authorize(AdministrativeUnitPermissions.Agreement.Update)]
        public async Task RemoveExonerationAsync(Guid agreementId, Guid serviceId)
        {

            //TODO: Validar tramites activos

            await ConvenioAppService.RemoveExonerationAsync(agreementId, serviceId);
        }

        [HttpGet]
        [Route("exoneration/{serviceId}")]
        public async Task<ListResultDto<ExonerationDto>> ObtenerExoneracionPorServicioAsync(Guid serviceId)
        {
            return await ConvenioAppService.ObtenerExoneracionPorServicioAsync(serviceId);
        }

        #endregion Exoneration
    }
}
