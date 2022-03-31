using System;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.Ventanilla
{
    public interface IVentanillaAppService : ICrudAppService<VentanillaDto, Guid, GetVentanillaInputDto,
    CrearActualizarVentanillaDto>
    {
        Task<PagedResultDto<VentanillaDto>> ObtenerPorUnidadAdministrativaIdAsync(Guid unidadAdministrativaId);
    }
}

