using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.ComponentModel.DataAnnotations;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class CrearActualizarConvenioDto {

        [Required]
        [StringLength(DomainCommonConsts.MaxDescriptionLength)]
        public virtual string Descripcion { get; set; }

        [Required]
        public virtual DateTime FechaCreacion { get; set; }

        public virtual DateTime? FechaExpiracion { get; set; }
    }
}
