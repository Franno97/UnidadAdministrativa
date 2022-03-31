using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{


    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/tipo-arancel")]
    [Authorize]
    public class TipoArancelController : AdministrativeUnitBaseController, ITipoArancelAppService
    {
        public ITipoArancelAppService TariffTypeAppService { get; }


        public TipoArancelController(ITipoArancelAppService tariffTypeAppService)
        {
            TariffTypeAppService = tariffTypeAppService;
        }


        [HttpGet]
        public virtual Task<PagedResultDto<TipoArancelDto>> GetListAsync(PagedAndSortedResultRequestDto input)
        {
            return TariffTypeAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("lookup")]
        public virtual Task<ListResultDto<TipoArancelLookupDto>> GetLookupAsync()
        {
            return TariffTypeAppService.GetLookupAsync();
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<TipoArancelDto> GetAsync(string id)
        {
            return TariffTypeAppService.GetAsync(id);
        }

        [HttpPost]
        public virtual Task<TipoArancelDto> CreateAsync(TipoArancelDto input)
        {
            return TariffTypeAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<TipoArancelDto> UpdateAsync(string id, TipoArancelDto input)
        {
            return TariffTypeAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(string id)
        {
            return TariffTypeAppService.DeleteAsync(id);
        }
    }
}
