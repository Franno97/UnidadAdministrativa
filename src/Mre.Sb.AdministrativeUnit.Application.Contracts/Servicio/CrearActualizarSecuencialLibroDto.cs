using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class CrearActualizarSecuencialLibroDto
    {
        [Required]
        public Guid ServicioId { get; set; }
        [Required]
        public Guid UnidadAdministrativaId { get; set; }
        [Required]
        public string LibroId { get; set; }
        [Required]
        public int NumeroPaginaPorVolumen { get; set; }
        [Required]
        public int VolumenActual { get; set; }
        public int SiguientePagina { get; set; }
        public int Anio { get; set; }
    }
}
