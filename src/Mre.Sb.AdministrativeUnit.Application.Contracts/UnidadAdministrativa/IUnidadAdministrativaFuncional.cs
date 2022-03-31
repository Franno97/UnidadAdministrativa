using System;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public interface IUnidadAdministrativaFuncional {
         
        Task<UnidadAdministrativaInfoDto> ObtenerUnidadAdministrativaDelFuncionalAsync(Guid usuarioId);

        Task<UnidadAdministrativaInfoDto> ObtenerUnidadAdministrativaDelFuncionalActualAsync();

        Task<PagedResultDto<FuncionarioInfoDto>> ObtenerFuncionariosPorUnidadAdministrativaAsync(Guid unidadAdministrativaId);

        Task<FuncionarioInfoExtendido> ObtenerFuncionarioPorUsuarioIdAsync(Guid usuarioId);
    }


}
