using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{


    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/moneda")]
    [Authorize]
    public class MonedaController : AdministrativeUnitBaseController, IMonedaAppService
    {
        public IMonedaAppService CurrencyAppService { get; }


        public MonedaController(IMonedaAppService currencyAppService)
        {
            CurrencyAppService = currencyAppService;
        }


        [HttpGet]
        public virtual Task<PagedResultDto<MonedaDto>> GetListAsync(PagedAndSortedResultRequestDto input)
        {
            return CurrencyAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("lookup")]
        public virtual Task<ListResultDto<MonedaLookupDto>> GetLookupAsync()
        {
            return CurrencyAppService.GetLookupAsync();
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<MonedaDto> GetAsync(string id)
        {
            return CurrencyAppService.GetAsync(id);
        }

        [HttpPost]
        public virtual Task<MonedaDto> CreateAsync(MonedaDto input)
        {
            return CurrencyAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<MonedaDto> UpdateAsync(string id, MonedaDto input)
        {
            return CurrencyAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(string id)
        {
            return CurrencyAppService.DeleteAsync(id);
        }
    }
}
