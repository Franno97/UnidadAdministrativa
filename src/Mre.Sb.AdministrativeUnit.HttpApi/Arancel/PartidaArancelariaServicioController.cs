using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{

    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/partida-arancelaria-servicio")]
    [Authorize]
    public class PartidaArancelariaServicioController : AdministrativeUnitBaseController, IPartidaArancelariaServicioAppService
    {
        public IPartidaArancelariaServicioAppService PartidaArancelariaServicioAppService { get; }


        public PartidaArancelariaServicioController(IPartidaArancelariaServicioAppService partidaArancelariaServicioAppService)
        {
            PartidaArancelariaServicioAppService = partidaArancelariaServicioAppService;
        }


        [HttpGet]
        [Route("{servicioId}")]
        public async Task<ListResultDto<PartidaArancelariaServicioDto>> ObtenerPartidaArancelariaPorServicioAsync(Guid servicioId)
        {
            return await PartidaArancelariaServicioAppService.ObtenerPartidaArancelariaPorServicioAsync(servicioId);
        }
    }
}
