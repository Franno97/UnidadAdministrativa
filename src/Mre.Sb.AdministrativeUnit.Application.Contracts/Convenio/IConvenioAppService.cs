using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public interface IConvenioAppService : 
      ICrudAppService<ConvenioDto,
          Guid,
          GetConvenioInput,
          CrearActualizarConvenioDto>
    {
        Task<ListResultDto<ConvenioLookupDto>> GetLookupAsync();

        #region Exoneration

        public Task<PagedResultDto<ExonerationDto>> GetExonerationsAsync(Guid agreementId, GetExoneracionInput input);

        public Task<ExonerationDto> GetExonerationAsync(Guid agreementId, Guid serviceId);

        public Task<ExonerationDto> AddExonerationAsync(Guid agreementId, CrearExoneracionDto input);

        public Task<ExonerationDto> UpdateExonerationAsync(Guid agreementId, Guid serviceId, ActualizarExoneracionDto input);

        public Task RemoveExonerationAsync(Guid agreementId, Guid serviceId);

        public Task<ListResultDto<ExonerationDto>> ObtenerExoneracionPorServicioAsync(Guid serviceId);

        #endregion Exoneration

    }

}
