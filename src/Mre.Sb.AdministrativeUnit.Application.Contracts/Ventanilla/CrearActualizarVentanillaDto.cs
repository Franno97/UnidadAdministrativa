using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.ComponentModel.DataAnnotations;

namespace Mre.Sb.UnidadAdministrativa.Ventanilla
{
    public class CrearActualizarVentanillaDto
    {
        [Required]
        public Guid UnidadAdministrativaId { get; set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        public string Nombre { get; set; }

        public bool AtencionPresencial { get; set; }

        public bool AtencionVirtual { get; set; }

        public string InicioAtencion { get; set; }

        public string FinAtencion { get; set; }

        public bool Activo { get; set; }
    }
}
