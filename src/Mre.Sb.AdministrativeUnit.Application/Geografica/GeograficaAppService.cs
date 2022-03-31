using Mre.Sb.Geographical;
using Mre.Sb.UnidadAdministrativa.Geografica;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa.Geografica
{
    public class GeograficaAppService : ApplicationService, IGeograficaAppService
    {
        private readonly CountryData countryData;

        public GeograficaAppService(CountryData countryData)
        {
            this.countryData = countryData;
        }
        public async Task<ListResultDto<CountryDto>> GetCountriesAsync()
        {
            var countries = countryData.GetAllCountry();

            return new ListResultDto<CountryDto>(
                ObjectMapper.Map<IEnumerable<Country>, List<CountryDto>>(countries)
            );
        }

        public async Task<CountryDto> GetCountryAsync(string countryCode)
        {
            var country = countryData.GetCountry(countryCode);
            return ObjectMapper.Map<Country, CountryDto>(country);
        }

        public async Task<ListResultDto<RegionDto>> GetRegionByCountryCodeAsync(string countryCode)
        {
            var regions = countryData.GetRegionByCountryCode(countryCode);

            return new ListResultDto<RegionDto>(
                 ObjectMapper.Map<List<Region>, List<RegionDto>>(regions)
             );
           
        }
    }


}
