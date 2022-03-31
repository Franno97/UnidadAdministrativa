using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{


    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/entidad-auspiciante")]
    [Authorize]
    public class EntidadAuspicianteController : AdministrativeUnitBaseController, IEntidadAuspicianteAppService
    {
        public IEntidadAuspicianteAppService EntidadAuspicianteAppService { get; }


        public EntidadAuspicianteController(IEntidadAuspicianteAppService entidadAuspicianteAppService)
        {
            EntidadAuspicianteAppService = entidadAuspicianteAppService;
        }


        [HttpGet]
        public virtual Task<PagedResultDto<EntidadAuspicianteDto>> GetListAsync(PagedAndSortedResultRequestDto input)
        {
            return EntidadAuspicianteAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("lookup")]
        public virtual Task<ListResultDto<EntidadAuspicianteLookupDto>> GetLookupAsync()
        {
            return EntidadAuspicianteAppService.GetLookupAsync();
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<EntidadAuspicianteDto> GetAsync(string id)
        {
            return EntidadAuspicianteAppService.GetAsync(id);
        }

        [HttpPost]
        public virtual Task<EntidadAuspicianteDto> CreateAsync(EntidadAuspicianteDto input)
        {
            return EntidadAuspicianteAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<EntidadAuspicianteDto> UpdateAsync(string id, EntidadAuspicianteDto input)
        {
            return EntidadAuspicianteAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(string id)
        {
            return EntidadAuspicianteAppService.DeleteAsync(id);
        }
    }
}
