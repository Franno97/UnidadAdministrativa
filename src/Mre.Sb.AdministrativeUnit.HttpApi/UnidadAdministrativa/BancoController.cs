using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{

    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/banco")]
    [Authorize]
    public class BancoController : AdministrativeUnitBaseController, IBancoAppService
    {
        public IBancoAppService BankAppService { get; }


        public BancoController(IBancoAppService bankAppService)
        {
            BankAppService = bankAppService;
        }


        [HttpGet]
        public virtual Task<PagedResultDto<BancoDto>> GetListAsync(PagedAndSortedResultRequestDto input)
        {
            return BankAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("lookup")]
        public virtual Task<ListResultDto<BancoLookupDto>> GetLookupAsync()
        {
            return BankAppService.GetLookupAsync();
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<BancoDto> GetAsync(string id)
        {
            return BankAppService.GetAsync(id);
        }

        [HttpPost]
        public virtual Task<BancoDto> CreateAsync(BancoDto input)
        {
            return BankAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<BancoDto> UpdateAsync(string id, BancoDto input)
        {
            return BankAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(string id)
        {
            return BankAppService.DeleteAsync(id);
        }
    }
}
