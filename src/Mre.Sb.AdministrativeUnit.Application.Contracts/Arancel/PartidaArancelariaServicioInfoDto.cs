//using System;
//using System.Collections.Generic;
//using System.Text;

using System;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class PartidaArancelariaServicioInfoDto
    {
        public Guid ServicioId { get; set; }
        public string Servicio { get; set; }
        public string TipoServicio { get; set; }
        public bool AtencionPresencial { get; set; }
        public bool AtencionSemiPresencial { get; set; }
        public bool AtencionVirtual { get; set; }
        public bool Activo { get; set; }
    }
}
