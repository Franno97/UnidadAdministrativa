using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Localization;
using Mre.Sb.AdministrativeUnit.Localization;
using Mre.Sb.AdministrativeUnit.Permissions;
using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.UnidadAdministrativa.UnidadAdministrativa;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Services;
using Volo.Abp.Authorization;
using Volo.Abp.Security.Encryption;
using Volo.Abp.Users;

namespace Mre.Sb.UnidadAdministrativa.FirmaElectronica
{
    [RemoteService(false)]
    [Authorize]
    public class ConfigurarFirmaElectronicaAppService : ApplicationService, IConfigurarFirmaElectronicaAppService
    {

        private const string TipoContenidoDefecto = "application/x-pkcs12";
        private const string ExtensionDefecto = "p12";
        private readonly string[] ExtensionesPermitidas = { ".p12"};


        private readonly IConfiguracionSignatarioAppService configuracionSignatarioAppService;
        private readonly UnidadAdministrativaManager administrativeUnitManager;
        private readonly ICurrentUser currentUser;
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;
        private readonly IStringEncryptionService encryptionService;

        public ConfigurarFirmaElectronicaAppService(
            IConfiguracionSignatarioAppService configuracionSignatarioAppService,
            UnidadAdministrativaManager administrativeUnitManager,
            ICurrentUser  currentUser,
            IStringLocalizer<AdministrativeUnitResource> localizer,
            IStringEncryptionService encryptionService )
        {
            this.configuracionSignatarioAppService = configuracionSignatarioAppService;
            this.administrativeUnitManager = administrativeUnitManager;
            this.currentUser = currentUser;
            this.localizer = localizer;
            this.encryptionService = encryptionService;
        }


        public async Task<bool> EsPermitidaAsync()
        {           
            //Reglas para configurar firma electronica
            var resultado = false;

            Guid? usuarioId = currentUser.Id;
            if (!usuarioId.HasValue)
            {
                throw new AbpAuthorizationException(localizer["ConfiguracionFirmaElectronica:UsuarioNoAutentificado"]); 
            }

            resultado = await administrativeUnitManager.EsSignatario(usuarioId.Value); 

            return resultado;
        }

        public async Task<bool> ExisteAsync()
        {
            var resultado = false;
  
            var esPermitido = await EsPermitidaAsync();
            if (esPermitido)
            {
                Guid? usuarioId = currentUser.Id;
 
                var configuracionSignatario = await configuracionSignatarioAppService.GetAsync(usuarioId.Value);
                
                if (configuracionSignatario != null)
                {
                    resultado = true;
                }
            }
             

            return resultado;
        }


       

        public async Task<bool> AgregarAsync(IFormFile archivoFirma, string claveFirma)
        {
            
            var esPermitido = await EsPermitidaAsync();
            if (!esPermitido)
            {
               throw new UserFriendlyException(localizer["Signatario:UsuarioSinAsignacion"]);
            }


            if (archivoFirma == null || archivoFirma.Length == 0)
            {
                throw new UserFriendlyException(localizer["ConfiguracionFirmaElectronica:SinArchivo"]);
            }

            var extension = Path.GetExtension(archivoFirma.FileName).ToLowerInvariant();

            if (string.IsNullOrEmpty(extension) || !ExtensionesPermitidas.Contains(extension))
            {
                throw new UserFriendlyException(localizer["ConfiguracionFirmaElectronica:ExtensionNoPermitida", extension]);
            }


            Guid? usuarioId = currentUser.Id;


            var nuevoRegistro = false;
            var configuracionSignatario = await configuracionSignatarioAppService.GetAsync(usuarioId.Value);
            if (configuracionSignatario == null)
            { 
                configuracionSignatario = new ConfiguracionSignatarioDto();
                nuevoRegistro = true;
            }

            configuracionSignatario.UsuarioId = usuarioId.Value;

            configuracionSignatario.Clave = encryptionService.Encrypt(claveFirma);

            configuracionSignatario.NombreArchivo = archivoFirma.FileName;

            using (var memoryStream = new MemoryStream())
            {
                archivoFirma.CopyTo(memoryStream);
                configuracionSignatario.Data = memoryStream.ToArray();
            }

            configuracionSignatario.TipoContenido = TipoContenidoDefecto;
            configuracionSignatario.Extension = ExtensionDefecto;


            if (nuevoRegistro)
            {
                await configuracionSignatarioAppService.CreateAsync(configuracionSignatario);
            }
            else {
                await configuracionSignatarioAppService.UpdateAsync(configuracionSignatario.Id, configuracionSignatario);
            }

      
            return true;
        }

        public Task<List<Guid>> PoseenConfiguracionAsync(List<Guid> usuariosIds)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> EliminarAsync()
        {
            
            var esPermitido = await EsPermitidaAsync();
            if (!esPermitido)
            {
                throw new UserFriendlyException(localizer["Signatario:UsuarioSinAsignacion"]);
            }

            Guid? usuarioId = currentUser.Id;

            await configuracionSignatarioAppService.DeleteAsync(usuarioId.Value);
           
            return true;
        }



        public async Task<bool> EliminarFirmaSignatarioAsync(EliminarFirmaSignatarioDto input)
        {
            await CheckPolicyAsync(AdministrativeUnitPermissions.SignatarioConfiguracion.Delete);

            Guid usuarioId = input.UsuarioId; 
            var configuracionSignatario = await configuracionSignatarioAppService.GetAsync(usuarioId);
            if (configuracionSignatario == null)
            {
                throw new UserFriendlyException(localizer["ConfiguracionFirmaElectronica:UsuarioSinConfiguracion"]);
            }


            await configuracionSignatarioAppService.DeleteAsync(usuarioId); 
            return true;
        }

        public async Task<ConfigurarFirmaElectronicaDto> ObtenerAsync(ConfigurarFirmaElectronicaInput input)
        {
            await CheckPolicyAsync(AdministrativeUnitPermissions.SignatarioConfiguracion.Default);

            Guid usuarioId = input.UsuarioId;
            var configuracionSignatario = await configuracionSignatarioAppService.GetAsync(usuarioId);
            if (configuracionSignatario == null)
            {
                return null;
            }


            var resultado = new ConfigurarFirmaElectronicaDto();

            resultado.Clave = encryptionService.Decrypt(configuracionSignatario.Clave);
            resultado.Data = configuracionSignatario.Data;
            resultado.NombreArchivo = configuracionSignatario.NombreArchivo;
            resultado.TipoContenido = configuracionSignatario.TipoContenido;
            resultado.UsuarioId = configuracionSignatario.UsuarioId;

            return resultado;
        }
    }
}
