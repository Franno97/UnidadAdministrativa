using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{


    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/tipo-exoneracion")]
    [Authorize]
    public class TipoExoneracionController : AdministrativeUnitBaseController, ITipoExoneracionAppService
    {
        public ITipoExoneracionAppService TipoExoneracionAppService { get; }


        public TipoExoneracionController(ITipoExoneracionAppService tipoExoneracionAppService)
        {
            TipoExoneracionAppService = tipoExoneracionAppService;
        }


        [HttpGet]
        public virtual Task<PagedResultDto<TipoExoneracionDto>> GetListAsync(PagedAndSortedResultRequestDto input)
        {
            return TipoExoneracionAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("lookup")]
        public virtual Task<ListResultDto<TipoExoneracionLookupDto>> GetLookupAsync()
        {
            return TipoExoneracionAppService.GetLookupAsync();
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<TipoExoneracionDto> GetAsync(string id)
        {
            return TipoExoneracionAppService.GetAsync(id);
        }

        [HttpPost]
        public virtual Task<TipoExoneracionDto> CreateAsync(TipoExoneracionDto input)
        {
            return TipoExoneracionAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<TipoExoneracionDto> UpdateAsync(string id, TipoExoneracionDto input)
        {
            return TipoExoneracionAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(string id)
        {
            return TipoExoneracionAppService.DeleteAsync(id);
        }
    }
}
