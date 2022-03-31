using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    

    public interface IMonedaAppService : ICrudAppService<MonedaDto, string>
    {
        Task<ListResultDto<MonedaLookupDto>> GetLookupAsync();
    }

}
