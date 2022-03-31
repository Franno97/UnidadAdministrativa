using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/AdministrativeUnit/cargo")]
    [Authorize]
    public class CargoController : AdministrativeUnitBaseController, ICargoAppService
    {
        public ICargoAppService PositionAppService { get; }


        public CargoController(ICargoAppService positionAppService)
        {
            PositionAppService = positionAppService;
        }


        [HttpGet]
        public virtual Task<PagedResultDto<CargoDto>> GetListAsync(PagedAndSortedResultRequestDto input)
        {
            return PositionAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("lookup")]
        public virtual Task<ListResultDto<CargoLookupDto>> GetLookupAsync()
        {
            return PositionAppService.GetLookupAsync();
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<CargoDto> GetAsync(string id)
        {
            return PositionAppService.GetAsync(id);
        }

        [HttpPost]
        public virtual Task<CargoDto> CreateAsync(CargoDto input)
        {
            return PositionAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<CargoDto> UpdateAsync(string id, CargoDto input)
        {
            return PositionAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(string id)
        {
            return PositionAppService.DeleteAsync(id);
        }
    }
}
