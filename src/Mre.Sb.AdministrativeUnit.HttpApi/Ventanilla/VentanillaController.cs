using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mre.Sb.UnidadAdministrativa.Ventanilla;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Ventanilla
{
    //class AgentAttentionController
    //{
    //}


    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/ventanilla")]
    [Authorize]
    public class VentanillaController : AdministrativeUnitBaseController, IVentanillaAppService
    {
        public IVentanillaAppService AgentAttentionAppService { get; }


        public VentanillaController(IVentanillaAppService agentAttentionAppService)
        {
            AgentAttentionAppService = agentAttentionAppService;
        }


        [HttpGet]
        public virtual Task<PagedResultDto<VentanillaDto>> GetListAsync(GetVentanillaInputDto input)
        {
            return AgentAttentionAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<VentanillaDto> GetAsync(Guid id)
        {
            return AgentAttentionAppService.GetAsync(id);
        }



        [HttpPost]
        public virtual Task<VentanillaDto> CreateAsync(CrearActualizarVentanillaDto input)
        {
            return AgentAttentionAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<VentanillaDto> UpdateAsync(Guid id, CrearActualizarVentanillaDto input)
        {
            return AgentAttentionAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(Guid id)
        {
            return AgentAttentionAppService.DeleteAsync(id);
        }

        [HttpGet]
        [Route("unidad-administrativa/{unidadAdministrativaId}")]
        public Task<PagedResultDto<VentanillaDto>> ObtenerPorUnidadAdministrativaIdAsync(Guid unidadAdministrativaId)
        {
            return AgentAttentionAppService.ObtenerPorUnidadAdministrativaIdAsync(unidadAdministrativaId);
        }
    }
}
