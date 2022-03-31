using Mre.Sb.UnidadAdministrativa.Dominio;
using System.ComponentModel.DataAnnotations;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class CrearActualizarServicioDto {

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        public string Nombre { get; set; }

        public bool AtencionPresencial { get; set; }
       
        public bool AtencionSemiPresencial { get; set; }
        
        public bool AtencionVirtual { get; set; }

        [Required]
        public string TipoServicioId { get; set; }

        [Required]
        public bool Activo { get; set; }
    }
}
