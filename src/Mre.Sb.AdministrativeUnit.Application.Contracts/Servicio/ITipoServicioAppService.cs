using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{


    public interface ITipoServicioAppService : ICrudAppService<TipoServicioDto, string>
    {
        Task<ListResultDto<TipoServicioLookupDto>> GetLookupAsync();
    }



}
