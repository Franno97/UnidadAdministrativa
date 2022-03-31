using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{

    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/nivel")]
    [Authorize]
    public class NivelController : AdministrativeUnitBaseController, INivelAppService
    {
        public INivelAppService LevelAppService { get; }


        public NivelController(INivelAppService levelAppService)
        {
            LevelAppService = levelAppService;
        }


        [HttpGet]
        public virtual Task<PagedResultDto<NivelDto>> GetListAsync(PagedAndSortedResultRequestDto input)
        {
            return LevelAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("lookup")]
        public virtual Task<ListResultDto<NivelLookupDto>> GetLookupAsync()
        {
            return LevelAppService.GetLookupAsync();
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<NivelDto> GetAsync(string id)
        {
            return LevelAppService.GetAsync(id);
        }

        [HttpPost]
        public virtual Task<NivelDto> CreateAsync(NivelDto input)
        {
            return LevelAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<NivelDto> UpdateAsync(string id, NivelDto input)
        {
            return LevelAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(string id)
        {
            return LevelAppService.DeleteAsync(id);
        }
    }
}
