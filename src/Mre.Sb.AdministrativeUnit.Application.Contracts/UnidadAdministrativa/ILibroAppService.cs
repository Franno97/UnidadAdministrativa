using Mre.Sb.UnidadAdministrativa.Servicio;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{

    public interface ILibroAppService : ICrudAppService<LibroDto, string>
    {
        Task<ListResultDto<LibroLookupDto>> GetLookupAsync();
    }

}
