using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public interface IConfiguracionSignatarioAppService : IApplicationService
    {
        Task<ConfiguracionSignatarioDto> GetAsync(Guid usuarioId);

        Task<ConfiguracionSignatarioDto> CreateAsync(ConfiguracionSignatarioDto input);

        Task<ConfiguracionSignatarioDto> UpdateAsync(Guid id, ConfiguracionSignatarioDto input);

        Task DeleteAsync(Guid usuarioId);

        /// <summary>
        /// Verificar que usuarios envidos en la lista poseen configuracion firma electronica
        /// </summary>
        /// <param name="usuariosIds"></param>
        /// <returns>Lista usuarios que tienen configuracion</returns>
        Task<List<Guid>> PoseenConfiguracionAsync(List<Guid> usuariosIds);


        /// <summary>
        /// Verificar si el usuario posee configuracion firma electronica
        /// </summary>
        /// <param name="usuariosId"></param>
        /// <returns></returns>
        Task<bool> PoseenConfiguracionAsync(Guid usuariosId);
    }


}
