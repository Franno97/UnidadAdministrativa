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
    [Route("api/unidad-administrativa/partida-arancelaria")]
    [Authorize]
    public class PartidaArancelariaController : AdministrativeUnitBaseController, IPartidaArancelariaAppService
    {
        public IPartidaArancelariaAppService TariffHeadingAppService { get; }


        public PartidaArancelariaController(IPartidaArancelariaAppService tariffHeadingAppService)
        {
            TariffHeadingAppService = tariffHeadingAppService;
        }


        [HttpGet]
        public virtual Task<PagedResultDto<PartidaArancelariaDto>> GetListAsync(GetPartidaArancelariaInput input)
        {
            return TariffHeadingAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("lookup")]
        public virtual Task<ListResultDto<PartidaArancelariaLookupDto>> GetLookupAsync()
        {
            return TariffHeadingAppService.GetLookupAsync();
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<PartidaArancelariaDto> GetAsync(Guid id)
        {
            return TariffHeadingAppService.GetAsync(id);
        }



        [HttpPost]
        public virtual Task<PartidaArancelariaDto> CreateAsync(CrearActualizarPartidaArancelariaDto input)
        {
            return TariffHeadingAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<PartidaArancelariaDto> UpdateAsync(Guid id, CrearActualizarPartidaArancelariaDto input)
        {
            return TariffHeadingAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(Guid id)
        {
            return TariffHeadingAppService.DeleteAsync(id);
        }

        [HttpGet]
        [Route("{tariffHeadingId}/service")]
        public Task<PagedResultDto<PartidaArancelariaServicioInfoDto>> GetServicesAsync(Guid tariffHeadingId, ObtenerPartidaArancelariaServicioInputDto input)
        {
            return TariffHeadingAppService.GetServicesAsync(tariffHeadingId, input);
        }

        [HttpPost]
        [Route("{tariffHeadingId}/service")]
        public Task AddServiceAsync(Guid tariffHeadingId, CrearPartidaArancelariaServicioDto input)
        {
            return TariffHeadingAppService.AddServiceAsync(tariffHeadingId, input);
        }

        [HttpDelete]
        [Route("{tariffHeadingId}/service/{serviceId}")]
        public Task RemoveServiceAsync(Guid tariffHeadingId, Guid serviceId)
        {
            return TariffHeadingAppService.RemoveServiceAsync(tariffHeadingId, serviceId);
        }

        
    }
}
