using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public interface IArancelAppService : 
      ICrudAppService<ArancelDto,
          Guid,
          ObtenerArancelInput,
          CrearActualizarArancelDto>
    {
        Task<ListResultDto<ArancelLookupDto>> GetLookupAsync();
        Task ChangeStateAsync(Guid id, bool isActive);


        #region Jerarquia Arancelaria


        Task<PagedResultDto<JerarquiaArancelariaDto>> ObtenerJerarquiasArancelariasAsync(Guid arancelId, GetJerarquiaArancelariaInput input);

        Task<JerarquiaArancelariaDto> ObtenerJerarquiaArancelariaAsync(Guid arancelId, Guid jerarquiaId);

        Task<JerarquiaArancelariaDto> AgregarJerarquiaArancelariaAsync(Guid arancelId, CrearActualizarJerarquiaArancelariaDto input);

        Task<JerarquiaArancelariaDto> ActualizarJerarquiaArancelariaAsync(Guid arancelId, Guid jerarquiaId, CrearActualizarJerarquiaArancelariaDto input);

        Task QuitarJerarquiaArancelariaAsync(Guid arancelId, Guid jerarquiaId);


        #endregion Jerarquia Arancelaria

    }

}
