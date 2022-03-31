using System;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    /// <summary>
    /// Clase para administrar la informacion de un servicio consular
    /// </summary>
    public class ServicioDto : IEntityDto<Guid>
    {
        public Guid Id { get; set; }

        public string Nombre { get;  set; }
      
        public string TipoServicioId { get; set; }

        public string TipoServicio { get; set; }

        public bool AtencionPresencial { get; set; }
        public bool AtencionSemiPresencial { get; set; }
        public bool AtencionVirtual { get; set; }

        public bool Activo { get;  set; }

    }
 
}
