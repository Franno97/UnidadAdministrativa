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
    [Route("api/unidad-administrativa/secuencial-libro")]
    [Authorize]
    public class SecuencialLibroController : AdministrativeUnitBaseController, ISecuencialLibroAppService
    {
        public ISecuencialLibroAppService SecuentialBookAppServiceAppService { get; }


        public SecuencialLibroController(ISecuencialLibroAppService secuentialBookAppServiceAppService)
        {
            SecuentialBookAppServiceAppService = secuentialBookAppServiceAppService;
        }


        [HttpGet]
        public virtual Task<PagedResultDto<SecuencialLibroDto>> GetListAsync(PagedAndSortedResultRequestDto input)
        {
            return SecuentialBookAppServiceAppService.GetListAsync(input);
        }

        [HttpGet]
        [Route("{id}")]
        public virtual Task<SecuencialLibroDto> GetAsync(Guid id)
        {
            return SecuentialBookAppServiceAppService.GetAsync(id);
        }


        [HttpGet]
        [Route("{administrativeUnitId}/servicio/{serviceId}")]
        public Task<PagedResultDto<SecuencialLibroDto>> GetByAdministrativeUnitServiceAsync(Guid serviceId, Guid administrativeUnitId)
        {
            return SecuentialBookAppServiceAppService.GetByAdministrativeUnitServiceAsync(serviceId, administrativeUnitId);
        }

        [HttpPost]
        public virtual Task<SecuencialLibroDto> CreateAsync(CrearActualizarSecuencialLibroDto input)
        {
            return SecuentialBookAppServiceAppService.CreateAsync(input);
        }

        [HttpPut]
        [Route("{id}")]
        public virtual Task<SecuencialLibroDto> UpdateAsync(Guid id, CrearActualizarSecuencialLibroDto input)
        {
            return SecuentialBookAppServiceAppService.UpdateAsync(id, input);
        }

        [HttpDelete]
        [Route("{id}")]
        public virtual Task DeleteAsync(Guid id)
        {
            return SecuentialBookAppServiceAppService.DeleteAsync(id);
        }
    }
}
