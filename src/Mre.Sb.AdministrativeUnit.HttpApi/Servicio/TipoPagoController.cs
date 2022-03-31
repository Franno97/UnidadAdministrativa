using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{


    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/tipo-pago")]
    [Authorize]
    public class TipoPagoController : AdministrativeUnitBaseController, ITipoPagoAppService
    {
        public ITipoPagoAppService PaymentTypeAppService { get; }


        public TipoPagoController(ITipoPagoAppService paymentTypeAppService)
        {
            PaymentTypeAppService = paymentTypeAppService;
        }


        [HttpGet]
        public virtual Task<PagedResultDto<TipoPagoDto>> GetListAsync(PagedAndSortedResultRequestDto input)
        {
            return PaymentTypeAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("lookup")]
        public virtual Task<ListResultDto<TipoPagoDto>> GetLookupAsync()
        {
            return PaymentTypeAppService.GetLookupAsync();
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<TipoPagoDto> GetAsync(string id)
        {
            return PaymentTypeAppService.GetAsync(id);
        }

        [HttpPost]
        public virtual Task<TipoPagoDto> CreateAsync(TipoPagoDto input)
        {
            return PaymentTypeAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<TipoPagoDto> UpdateAsync(string id, TipoPagoDto input)
        {
            return PaymentTypeAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(string id)
        {
            return PaymentTypeAppService.DeleteAsync(id);
        }
    }


     
}
