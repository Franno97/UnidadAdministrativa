using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public interface IPartidaArancelariaAppService :
      ICrudAppService<PartidaArancelariaDto,
          Guid,
          GetPartidaArancelariaInput,
          CrearActualizarPartidaArancelariaDto>
    {
        Task<ListResultDto<PartidaArancelariaLookupDto>> GetLookupAsync();

        public Task<PagedResultDto<PartidaArancelariaServicioInfoDto>> GetServicesAsync(Guid tariffHeadingId, ObtenerPartidaArancelariaServicioInputDto input);
        
        public Task AddServiceAsync(Guid tariffHeadingId, CrearPartidaArancelariaServicioDto input);
        
        public Task RemoveServiceAsync(Guid tariffHeadingId, Guid serviceId);

    }

}
