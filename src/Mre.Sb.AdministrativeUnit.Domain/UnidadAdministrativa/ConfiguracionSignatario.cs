using Microsoft.Extensions.Localization;
using Mre.Sb.AdministrativeUnit.Localization;
using System;
using System.ComponentModel.DataAnnotations;
using Volo.Abp.Domain.Entities;
using Volo.Abp.Domain.Entities.Auditing;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Domain.Services;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
   
    /// <summary>
    /// Entidad para configuracion de archivo de firma electronica del signatario
    /// </summary>
    public class ConfiguracionSignatario : AuditedEntity<Guid>
    {

        protected ConfiguracionSignatario()
        {

        }

        public ConfiguracionSignatario(Guid id, Guid usuarioId, string nombreArchivo, string tipoContenido, string extension, byte[] data, string clave)
        {
            Id = id;
            UsuarioId = usuarioId;
            NombreArchivo = nombreArchivo;
            TipoContenido = tipoContenido;
            Extension = extension;
            Data = data;
            Clave = clave;
        }

        /// <summary>
        /// Identificador del usuario
        /// </summary>
        [Required]
        public Guid UsuarioId { get; set; }

        /// <summary>
        /// Nombre del archivo de certificado de firma electronica
        /// </summary>
        [StringLength(SignatarioConsts.MaxNombreArchivoLength)]
        public virtual string NombreArchivo { get; set; }

        /// <summary>
        /// Tipo de contenido del archivo de firma electronica
        /// </summary>
        [StringLength(SignatarioConsts.MaxTipoContenidoLength)]
        public virtual string TipoContenido { get; set; }

        /// <summary>
        /// Extension del archivo de firma electronica. Por lo general será .p12
        /// </summary>
        [StringLength(SignatarioConsts.MaxExtensionLength)]
        public virtual string Extension { get; set; }

        /// <summary>
        /// Data en binario del archivo de firma electronica
        /// </summary>
        [Required]
        public virtual byte[] Data { get; set; }

        /// <summary>
        /// Clave de firma electronica encriptada
        /// </summary>
        [Required]
        [StringLength(SignatarioConsts.MaxClaveLength)]
        public virtual string Clave { get; set; }

 
    }

}
