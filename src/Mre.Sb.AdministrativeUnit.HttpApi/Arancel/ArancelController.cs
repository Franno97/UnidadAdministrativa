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
    [Route("api/unidad-administrativa/arancel")]
    [Authorize]
    public class ArancelController : AdministrativeUnitBaseController, IArancelAppService
    {
        public IArancelAppService TariffAppService { get; }


        public ArancelController(IArancelAppService tariffAppService)
        {
            TariffAppService = tariffAppService;
        }


        [HttpGet]
        public virtual Task<PagedResultDto<ArancelDto>> GetListAsync(ObtenerArancelInput input)
        {
            return TariffAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("lookup")]
        public virtual Task<ListResultDto<ArancelLookupDto>> GetLookupAsync()
        {
            return TariffAppService.GetLookupAsync();
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<ArancelDto> GetAsync(Guid id)
        {
            return TariffAppService.GetAsync(id);
        }



        [HttpPost]
        public virtual Task<ArancelDto> CreateAsync(CrearActualizarArancelDto input)
        {
            return TariffAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<ArancelDto> UpdateAsync(Guid id, CrearActualizarArancelDto input)
        {
            return TariffAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(Guid id)
        {
            return TariffAppService.DeleteAsync(id);
        }

        [HttpPut]
        [Route("{id}/state/{isActive}")]
        public Task ChangeStateAsync(Guid id, bool isActive)
        {
            return TariffAppService.ChangeStateAsync(id, isActive);
        }


        #region Jerarquia Arancelaria


        [HttpGet]
        [Route("{arancelId}/jerarquiaarancelaria")]
        public Task<PagedResultDto<JerarquiaArancelariaDto>> ObtenerJerarquiasArancelariasAsync(Guid arancelId, GetJerarquiaArancelariaInput input)
        {
            return TariffAppService.ObtenerJerarquiasArancelariasAsync(arancelId, input);
        }


        [HttpGet]
        [Route("{arancelId}/jerarquiaarancelaria/{jerarquiaId}")]
        public Task<JerarquiaArancelariaDto> ObtenerJerarquiaArancelariaAsync(Guid arancelId, Guid jerarquiaId)
        {
            return TariffAppService.ObtenerJerarquiaArancelariaAsync(arancelId, jerarquiaId);
        }


        [HttpPost]
        [Route("{arancelId}/jerarquiaarancelaria")]
        public Task<JerarquiaArancelariaDto> AgregarJerarquiaArancelariaAsync(Guid arancelId, CrearActualizarJerarquiaArancelariaDto input)
        {
            return TariffAppService.AgregarJerarquiaArancelariaAsync(arancelId, input);
        }


        [HttpPut]
        [Route("{arancelId}/jerarquiaarancelaria/{jerarquiaId}")]
        public Task<JerarquiaArancelariaDto> ActualizarJerarquiaArancelariaAsync(Guid arancelId, Guid jerarquiaId, CrearActualizarJerarquiaArancelariaDto input)
        {
            return TariffAppService.ActualizarJerarquiaArancelariaAsync(arancelId, jerarquiaId, input);
        }

        [HttpDelete]
        [Route("{arancelId}/jerarquiaarancelaria/{jerarquiaId}")]
        public Task QuitarJerarquiaArancelariaAsync(Guid arancelId, Guid jerarquiaId)
        {
            return TariffAppService.QuitarJerarquiaArancelariaAsync(arancelId, jerarquiaId);
        }


        #endregion Jerarquia Arancelaria
    }
}
