using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
     
    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/unidad-administrativa-tipo")]
    [Authorize]
    public class UnidadAdministrativaTipoController : AdministrativeUnitBaseController, IUnidadAdministrativaTipoAppService
    {
        public IUnidadAdministrativaTipoAppService AdministrativeUnitTypeAppService { get; }


        public UnidadAdministrativaTipoController(IUnidadAdministrativaTipoAppService  administrativeUnitTypeAppService)
        {
            AdministrativeUnitTypeAppService = administrativeUnitTypeAppService;
        }


        [HttpGet]
        public virtual Task<PagedResultDto<UnidadAdministrativaTipoDto>> GetListAsync(PagedAndSortedResultRequestDto input)
        {
            var claimsPrincipal = this.HttpContext.User;


            return AdministrativeUnitTypeAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("obtener-lista-info")]
        public virtual Task<ListResultDto<UnidadAdministrativaTipoInfoDto>> ObtenerListaInfoAsync()
        {
            return AdministrativeUnitTypeAppService.ObtenerListaInfoAsync();
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<UnidadAdministrativaTipoDto> GetAsync(string id)
        {
            return AdministrativeUnitTypeAppService.GetAsync(id);
        }

        [HttpPost]
        public virtual Task<UnidadAdministrativaTipoDto> CreateAsync(UnidadAdministrativaTipoDto input)
        {
            return AdministrativeUnitTypeAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<UnidadAdministrativaTipoDto> UpdateAsync(string id, UnidadAdministrativaTipoDto input)
        {
            return AdministrativeUnitTypeAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(string id)
        {
            return AdministrativeUnitTypeAppService.DeleteAsync(id);
        }
    }
}
