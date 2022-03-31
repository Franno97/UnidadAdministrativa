using System;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public interface IServicioAppService :
      ICrudAppService<ServicioDto,
          Guid,
          GetServicioInput,
          CrearActualizarServicioDto>
    {


        Task<ListResultDto<ServicioDto>> GetLookupAsync(bool? isActive);

    }
}
