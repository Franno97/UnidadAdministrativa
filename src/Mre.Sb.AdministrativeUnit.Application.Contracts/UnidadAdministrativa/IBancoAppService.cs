using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{


    public interface IBancoAppService : ICrudAppService<BancoDto, string>
    {
        Task<ListResultDto<BancoLookupDto>> GetLookupAsync();
    }

}
