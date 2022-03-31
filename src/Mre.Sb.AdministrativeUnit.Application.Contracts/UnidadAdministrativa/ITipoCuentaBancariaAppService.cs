using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{

    public interface ITipoCuentaBancariaAppService : ICrudAppService<TipoCuentaBancariaDto, string>
    {
        Task<ListResultDto<TipoCuentaBancariaDto>> GetLookupAsync();
    }
}
