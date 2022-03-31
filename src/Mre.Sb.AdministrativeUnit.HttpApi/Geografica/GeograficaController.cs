using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Geografica
{

    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/geographical")]
    public class GeograficaController : AdministrativeUnitBaseController, IGeograficaAppService
    {
        private IGeograficaAppService GeographicalAppService { get; }

        public GeograficaController(IGeograficaAppService geographicalAppService)
        {
            GeographicalAppService = geographicalAppService;
        }

        [HttpGet]
        [Route("country")]
        public Task<ListResultDto<CountryDto>> GetCountriesAsync()
        {
            return GeographicalAppService.GetCountriesAsync();
        }

        [HttpGet]
        [Route("{countryCode}/country")]
        public Task<CountryDto> GetCountryAsync(string countryCode)
        {
            return GeographicalAppService.GetCountryAsync(countryCode);
        }

        [HttpGet]
        [Route("{countryCode}/regions")]
        public Task<ListResultDto<RegionDto>> GetRegionByCountryCodeAsync(string countryCode)
        {
            return GeographicalAppService.GetRegionByCountryCodeAsync(countryCode);
        }
    }
}
