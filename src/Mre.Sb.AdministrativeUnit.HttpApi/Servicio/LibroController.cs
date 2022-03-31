using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mre.Sb.UnidadAdministrativa.UnidadAdministrativa;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{

    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/libro")]
    [Authorize]
    public class LibroController : AdministrativeUnitBaseController, ILibroAppService
    {
        public ILibroAppService BookAppService { get; }


        public LibroController(ILibroAppService bookAppService)
        {
            BookAppService = bookAppService;
        }


        [HttpGet]
        public virtual Task<PagedResultDto<LibroDto>> GetListAsync(PagedAndSortedResultRequestDto input)
        {
            return BookAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("lookup")]
        public virtual Task<ListResultDto<LibroLookupDto>> GetLookupAsync()
        {
            return BookAppService.GetLookupAsync();
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<LibroDto> GetAsync(string id)
        {
            return BookAppService.GetAsync(id);
        }

        [HttpPost]
        public virtual Task<LibroDto> CreateAsync(LibroDto input)
        {
            return BookAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<LibroDto> UpdateAsync(string id, LibroDto input)
        {
            return BookAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(string id)
        {
            return BookAppService.DeleteAsync(id);
        }
    }
}
