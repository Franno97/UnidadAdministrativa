using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using Microsoft.Extensions.Logging;
using Mre.Sb.AdministrativeUnit.Localization;
using System.Threading.Tasks;
using Volo.Abp;

namespace Mre.Sb.UnidadAdministrativa.FirmaElectronica
{
    [RemoteService(false)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/configurar-firma-electronica")]
    [Authorize]
    public class ConfigurarFirmaElectronicaController : AdministrativeUnitBaseController //, IConfigurarFirmaElectronicaAppService
    {
        private readonly IConfigurarFirmaElectronicaAppService configurarFirmaElectronicaAppService;
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;
        private readonly ILogger<ConfigurarFirmaElectronicaController> logger;

        public ConfigurarFirmaElectronicaController(IConfigurarFirmaElectronicaAppService configurarFirmaElectronicaAppService,
            IStringLocalizer<AdministrativeUnitResource> localizer,
            ILogger<ConfigurarFirmaElectronicaController> logger)
        {
            this.configurarFirmaElectronicaAppService = configurarFirmaElectronicaAppService;
            this.localizer = localizer;
            this.logger = logger;
        }

        [HttpGet]
        [Route("permitida")]
        public Task<bool> EsPermitidaAsync()
        {
            return configurarFirmaElectronicaAppService.EsPermitidaAsync(); 
        }

        [HttpGet]
        [Route("existe")]
        public Task<bool> ExisteAsync()
        {
            return configurarFirmaElectronicaAppService.ExisteAsync();
        }

        [HttpGet]
        public async Task<IActionResult> ObtenerAsync(ConfigurarFirmaElectronicaInput input)
        {
            var  data = await  configurarFirmaElectronicaAppService.ObtenerAsync(input);

            if (data == null) {
                logger.LogWarning("No existe configuracion firma electronica. UsuarioId {UsuarioId}", input.UsuarioId);
                return NotFound();
            }
            
            var fileContentResult = File(data.Data, data.TipoContenido, data.NombreArchivo);

            Response.Headers.Add("X-MRE-SB-FIRMA-ELECTRONICA-CLAVE", data.Clave);

            return fileContentResult;
        }



        [HttpPut]
        public Task<bool> AgregarAsync(IFormFile archivoFirma, [FromForm] string claveFirma)
        {
            return configurarFirmaElectronicaAppService.AgregarAsync(archivoFirma, claveFirma);

        }

        [HttpDelete]
        public Task<bool> EliminarAsync()
        {
            return configurarFirmaElectronicaAppService.EliminarAsync();

        }

        [HttpDelete]
        [Route("eliminar-firma-usuario")]
        public Task<bool> EliminarFirmaSignatarioAsync(EliminarFirmaSignatarioDto input)
        {
            return configurarFirmaElectronicaAppService.EliminarFirmaSignatarioAsync(input);
        }



        
    }
}
