using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{

    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/tipo-cuenta-bancaria")]
    [Authorize]
    public class TipoCuentaBancariaController : AdministrativeUnitBaseController, ITipoCuentaBancariaAppService
    {
        public ITipoCuentaBancariaAppService TipoCuentaBancariaAppService { get; }


        public TipoCuentaBancariaController(ITipoCuentaBancariaAppService tipoCuentaBancariaAppService)
        {
            TipoCuentaBancariaAppService = tipoCuentaBancariaAppService;
        }


        [HttpGet]
        public virtual Task<PagedResultDto<TipoCuentaBancariaDto>> GetListAsync(PagedAndSortedResultRequestDto input)
        {
            return TipoCuentaBancariaAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("obtener-lista-info")]
        public virtual Task<ListResultDto<TipoCuentaBancariaDto>> GetLookupAsync()
        {
            return TipoCuentaBancariaAppService.GetLookupAsync();
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<TipoCuentaBancariaDto> GetAsync(string id)
        {
            return TipoCuentaBancariaAppService.GetAsync(id);
        }

        [HttpPost]
        public virtual Task<TipoCuentaBancariaDto> CreateAsync(TipoCuentaBancariaDto input)
        {
            return TipoCuentaBancariaAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<TipoCuentaBancariaDto> UpdateAsync(string id, TipoCuentaBancariaDto input)
        {
            return TipoCuentaBancariaAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(string id)
        {
            return TipoCuentaBancariaAppService.DeleteAsync(id);
        }
    }
}
