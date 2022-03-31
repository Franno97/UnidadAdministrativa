using System;
using System.ComponentModel.DataAnnotations;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public class CrearUnidadAdministrativaServicioDto
    {
        [Required]
        public Guid ServicioId { get; set; }

        [Required]
        public string TipoPagoId { get; set; }


        [Required]
        public bool Activo { get; set; }
    }
}
