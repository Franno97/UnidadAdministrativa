using System;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public interface ISecuencialLibroAppService : ICrudAppService<SecuencialLibroDto, Guid, PagedAndSortedResultRequestDto, CrearActualizarSecuencialLibroDto>
    {
        public Task<PagedResultDto<SecuencialLibroDto>> GetByAdministrativeUnitServiceAsync(Guid serviceId, Guid administrativeUnitId);
    }

}
