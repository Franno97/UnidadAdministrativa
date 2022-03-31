using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{

    public interface INivelAppService : ICrudAppService<NivelDto, string>
    {
        Task<ListResultDto<NivelLookupDto>> GetLookupAsync();
    }

}
