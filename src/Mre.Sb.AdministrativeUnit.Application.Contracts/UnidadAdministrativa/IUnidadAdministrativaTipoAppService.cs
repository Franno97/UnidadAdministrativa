using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public interface IUnidadAdministrativaTipoAppService : ICrudAppService<UnidadAdministrativaTipoDto,
            string>
    {

        Task<ListResultDto<UnidadAdministrativaTipoInfoDto>> ObtenerListaInfoAsync();

    }
}
