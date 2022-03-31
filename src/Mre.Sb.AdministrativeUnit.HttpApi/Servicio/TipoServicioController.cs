using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{


    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/servicio-tipo")]
    [Authorize]
    public class TipoServicioController : AdministrativeUnitBaseController, ITipoServicioAppService
    {
        public ITipoServicioAppService ServiceTypeAppService { get; }


        public TipoServicioController(ITipoServicioAppService serviceTypeAppService)
        {
            ServiceTypeAppService = serviceTypeAppService;
        }


        [HttpGet]
        public virtual Task<PagedResultDto<TipoServicioDto>> GetListAsync(PagedAndSortedResultRequestDto input)
        {
            return ServiceTypeAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("lookup")]
        public virtual Task<ListResultDto<TipoServicioLookupDto>> GetLookupAsync()
        {
            return ServiceTypeAppService.GetLookupAsync();
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<TipoServicioDto> GetAsync(string id)
        {
            return ServiceTypeAppService.GetAsync(id);
        }

        [HttpPost]
        public virtual Task<TipoServicioDto> CreateAsync(TipoServicioDto input)
        {
            return ServiceTypeAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<TipoServicioDto> UpdateAsync(string id, TipoServicioDto input)
        {
            return ServiceTypeAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(string id)
        {
            return ServiceTypeAppService.DeleteAsync(id);
        }
    }

}
