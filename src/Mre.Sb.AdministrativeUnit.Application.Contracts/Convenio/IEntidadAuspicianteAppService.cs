using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    
    public interface IEntidadAuspicianteAppService : ICrudAppService<EntidadAuspicianteDto, string>
    {
        Task<ListResultDto<EntidadAuspicianteLookupDto>> GetLookupAsync();
    }


}
