using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;

namespace Mre.Sb.UnidadAdministrativa.FirmaElectronica
{
    public interface IConfigurarFirmaElectronicaAppService {

        /// <summary>
        /// Se permite configurar archivo firma electronica para usuario autentificado
        /// </summary>
        /// <returns></returns>
        Task<bool> EsPermitidaAsync();

        /// <summary>
        /// Si existe configuracion  firma electronica para usuario autentificado
        /// </summary>
        /// <returns></returns>
        Task<bool> ExisteAsync();

        /// <summary>
        /// Agregar firma electronica al usuario autentificado
        /// </summary>
        /// <param name="archivoFirma"></param>
        /// <param name="claveFirma"></param>
        /// <returns></returns>
        Task<bool> AgregarAsync(
          IFormFile archivoFirma,
          string claveFirma);
         

      
        /// <summary>
        /// Eliminar firma al usuario autentificado
        /// </summary>
        /// <returns></returns>
        Task<bool> EliminarAsync();

        /// <summary>
        /// Eliminar la configuracion firma de un usuario especifico.
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        Task<bool> EliminarFirmaSignatarioAsync(EliminarFirmaSignatarioDto input);

        /// <summary>
        /// Obtener la configuracion firma de un usuario especifico.
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        Task<ConfigurarFirmaElectronicaDto> ObtenerAsync(ConfigurarFirmaElectronicaInput input);

    }

    public class ConfigurarFirmaElectronicaInput
    {
      
        [Required]
        public Guid UsuarioId { get; set; }

    }

    public class ConfigurarFirmaElectronicaDto
    {
      
        public Guid UsuarioId { get; set; }

       
        public  string NombreArchivo { get; set; }

        public  string TipoContenido { get; set; }

        public  byte[] Data { get; set; }

       
        public  string Clave { get; set; }
    }


    public class EliminarFirmaSignatarioDto
    {
        [Required]
        public Guid UnidadAdministrativaId { get; set; }

        [Required]
        public Guid UsuarioId { get; set; }

        [Required]
        public Guid ServicioId { get; set; }
       
    }
}
