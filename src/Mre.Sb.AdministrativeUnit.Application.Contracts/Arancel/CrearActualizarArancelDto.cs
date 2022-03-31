using Mre.Sb.UnidadAdministrativa.Dominio;
using System.ComponentModel.DataAnnotations;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class CrearActualizarArancelDto {

        [Required]
        [StringLength(DomainCommonConsts.MaxDescriptionLength)]
        public virtual string Descripcion { get; set; }


        [Required]
        public string MonedaId { get; set; }


        [Required]
        public bool Activo { get; set; }
    }
}
