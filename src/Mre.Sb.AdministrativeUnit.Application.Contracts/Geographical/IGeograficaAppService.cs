using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.Geografica
{
    public interface IGeograficaAppService : IApplicationService
    {
        Task<ListResultDto<CountryDto>> GetCountriesAsync();

        Task<CountryDto> GetCountryAsync(string countryCode);

        Task<ListResultDto<RegionDto>> GetRegionByCountryCodeAsync(string countryCode);


    }
}
