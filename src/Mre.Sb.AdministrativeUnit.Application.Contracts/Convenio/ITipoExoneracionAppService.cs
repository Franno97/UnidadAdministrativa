using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    
    public interface ITipoExoneracionAppService : ICrudAppService<TipoExoneracionDto, string>
    {
        Task<ListResultDto<TipoExoneracionLookupDto>> GetLookupAsync();
    }


}
