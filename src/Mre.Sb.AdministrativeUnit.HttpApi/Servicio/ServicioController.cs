using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{


    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/servicio")]
    [Authorize]
    public class ServicioController : AdministrativeUnitBaseController, IServicioAppService
    {
        public IServicioAppService ServiceAppService { get; }


        public ServicioController(IServicioAppService serviceAppService)
        {
            ServiceAppService = serviceAppService;
        }


        [HttpGet]
        public virtual Task<PagedResultDto<ServicioDto>> GetListAsync(GetServicioInput input)
        {
            return ServiceAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("lookup")]
        public virtual Task<ListResultDto<ServicioDto>> GetLookupAsync(bool? isActive)
        {
            return ServiceAppService.GetLookupAsync(isActive);
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<ServicioDto> GetAsync(Guid id)
        {
            return ServiceAppService.GetAsync(id);
        }

        [HttpPost]
        public virtual Task<ServicioDto> CreateAsync(CrearActualizarServicioDto input)
        {
            return ServiceAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<ServicioDto> UpdateAsync(Guid id, CrearActualizarServicioDto input)
        {
            return ServiceAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(Guid id)
        {
            return ServiceAppService.DeleteAsync(id);
        }
    }
}
