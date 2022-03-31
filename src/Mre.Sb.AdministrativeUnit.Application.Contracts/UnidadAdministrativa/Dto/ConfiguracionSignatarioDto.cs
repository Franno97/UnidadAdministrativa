using System;
using Volo.Abp.Application.Dtos;
using System.ComponentModel.DataAnnotations;
using Mre.Sb.UnidadAdministrativa.Dominio;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public class ConfiguracionSignatarioDto : IEntityDto<Guid>
    {
        public Guid Id { get; set; }

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
