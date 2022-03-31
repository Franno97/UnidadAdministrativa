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
    [Route("api/unidad-administrativa/jerarquia-arancelaria")]
    [Authorize]
    public class JerarquiaArancelariaController : AdministrativeUnitBaseController, IJerarquiaArancelariaAppService
    {
        public IJerarquiaArancelariaAppService JerarquiaArancelariaAppService { get; }


        public JerarquiaArancelariaController(IJerarquiaArancelariaAppService tariffHierarchyAppService)
        {
            JerarquiaArancelariaAppService = tariffHierarchyAppService;
        }

        [HttpGet]
        public virtual Task<PagedResultDto<JerarquiaArancelariaDto>> GetListAsync(GetJerarquiaArancelariaInput input)
        {
            return JerarquiaArancelariaAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("lookup")]
        public virtual Task<ListResultDto<JerarquiaArancelariaLookupDto>> GetLookupAsync()
        {
            return JerarquiaArancelariaAppService.GetLookupAsync();
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<JerarquiaArancelariaDto> GetAsync(Guid id)
        {
            return JerarquiaArancelariaAppService.GetAsync(id);
        }



        [HttpPost]
        public virtual Task<JerarquiaArancelariaDto> CreateAsync(CrearActualizarJerarquiaArancelariaDto input)
        {
            return JerarquiaArancelariaAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<JerarquiaArancelariaDto> UpdateAsync(Guid id, CrearActualizarJerarquiaArancelariaDto input)
        {
            return JerarquiaArancelariaAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(Guid id)
        {
            return JerarquiaArancelariaAppService.DeleteAsync(id);
        }


        #region Partida Arancelaria


        [HttpGet]
        [Route("{jerarquiaArancelariaId}/partidaarancelaria")]
        public Task<PagedResultDto<PartidaArancelariaDto>> ObtenerPartidasArancelariasAsync(Guid jerarquiaArancelariaId, GetPartidaArancelariaInput input)
        {
            return JerarquiaArancelariaAppService.ObtenerPartidasArancelariasAsync(jerarquiaArancelariaId, input);
        }

        [HttpGet]
        [Route("{jerarquiaArancelariaId}/partidaarancelaria/{partidaArancelariaId}")]
        public Task<PartidaArancelariaDto> ObtenerPartidaArancelariaAsync(Guid jerarquiaArancelariaId, Guid partidaArancelariaId)
        {
            return JerarquiaArancelariaAppService.ObtenerPartidaArancelariaAsync(jerarquiaArancelariaId, partidaArancelariaId);
        }

        [HttpPost]
        [Route("{jerarquiaArancelariaId}/partidaarancelaria")]
        public Task<PartidaArancelariaDto> AgregarPartidaArancelariaAsync(Guid jerarquiaArancelariaId, CrearActualizarPartidaArancelariaDto input)
        {
            return JerarquiaArancelariaAppService.AgregarPartidaArancelariaAsync(jerarquiaArancelariaId, input);
        }

        [HttpPut]
        [Route("{jerarquiaArancelariaId}/partidaarancelaria/{partidaArancelariaId}")]
        public Task<PartidaArancelariaDto> ActualizarPartidaArancelariaAsync(Guid jerarquiaArancelariaId, Guid partidaArancelariaId, CrearActualizarPartidaArancelariaDto input)
        {
            return JerarquiaArancelariaAppService.ActualizarPartidaArancelariaAsync(jerarquiaArancelariaId, partidaArancelariaId, input);
        }

        [HttpDelete]
        [Route("{jerarquiaArancelariaId}/partidaarancelaria/{partidaArancelariaId}")]
        public Task QuitarPartidaArancelariaAsync(Guid jerarquiaArancelariaId, Guid partidaArancelariaId)
        {
            return JerarquiaArancelariaAppService.QuitarPartidaArancelariaAsync(jerarquiaArancelariaId, partidaArancelariaId);
        }


        #endregion Partida Arancelaria
    }
}
