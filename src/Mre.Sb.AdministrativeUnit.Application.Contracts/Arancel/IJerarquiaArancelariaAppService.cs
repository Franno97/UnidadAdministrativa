using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public interface IJerarquiaArancelariaAppService :
      ICrudAppService<JerarquiaArancelariaDto,
          Guid,
          GetJerarquiaArancelariaInput,
          CrearActualizarJerarquiaArancelariaDto>
    {
        Task<ListResultDto<JerarquiaArancelariaLookupDto>> GetLookupAsync();


        #region Partida Arancelaria

        Task<PagedResultDto<PartidaArancelariaDto>> ObtenerPartidasArancelariasAsync(Guid jerarquiaArancelariaId, GetPartidaArancelariaInput input);

        Task<PartidaArancelariaDto> ObtenerPartidaArancelariaAsync(Guid jerarquiaArancelariaId, Guid partidaArancelariaId);

        Task<PartidaArancelariaDto> AgregarPartidaArancelariaAsync(Guid jerarquiaArancelariaId, CrearActualizarPartidaArancelariaDto input);

        Task<PartidaArancelariaDto> ActualizarPartidaArancelariaAsync(Guid jerarquiaArancelariaId, Guid partidaArancelariaId, CrearActualizarPartidaArancelariaDto input);

        Task QuitarPartidaArancelariaAsync(Guid jerarquiaArancelariaId, Guid partidaArancelariaId);

        #endregion Partida Arancelaria
    }

}
