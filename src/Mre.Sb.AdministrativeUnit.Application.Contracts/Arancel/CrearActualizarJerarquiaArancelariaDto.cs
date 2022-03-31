using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.ComponentModel.DataAnnotations;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class CrearActualizarJerarquiaArancelariaDto 
    {

        [Required]
        public Guid ArancelId { get; set; }

        [Required]
        public virtual string TipoArancelId { get; set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxDescriptionLength)]
        public virtual string Descripcion { get; set; }

        [Required]
        public virtual int Orden { get; set; }

        public virtual int NumeroJerarquia { get; set; }

    }
}
