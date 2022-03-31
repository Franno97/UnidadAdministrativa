using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{

    public class ActualizarUnidadAdministrativaServicioDto
    {
      

        [Required]
        public string TipoPagoId { get; set; }


        [Required]
        public bool Activo { get; set; }
    }
}
