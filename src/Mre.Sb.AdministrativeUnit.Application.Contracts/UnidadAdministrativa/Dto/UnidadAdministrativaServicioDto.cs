using System;
using System.Collections.Generic;
using System.Text;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public class UnidadAdministrativaServicioDto
    {
        public Guid UnidadAdministrativaId { get; set; }
         
        public Guid ServicioId { get; set; }

        public string Servicio { get; set; }


        public string TipoPago { get; set; }


        public string TipoPagoId { get; set; }
         
        public bool Activo { get; set; }
    }
}
