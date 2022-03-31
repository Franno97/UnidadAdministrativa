using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public interface ICargoAppService : ICrudAppService<CargoDto, string>
    {
        Task<ListResultDto<CargoLookupDto>> GetLookupAsync();
    }

}
