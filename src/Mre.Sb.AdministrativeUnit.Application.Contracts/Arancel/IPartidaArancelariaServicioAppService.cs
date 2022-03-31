using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public interface IPartidaArancelariaServicioAppService
      
    {
        /// <summary>
        /// Obtener partida arancelaria a la cual esta asociada un servicio, se consedera solo el arancel activo
        /// </summary>
        /// <param name="servicioId"></param>
        /// <returns></returns>
        Task<ListResultDto<PartidaArancelariaServicioDto>> ObtenerPartidaArancelariaPorServicioAsync(Guid servicioId);

    }

}
