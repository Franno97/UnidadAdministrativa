using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public class SignatarioDto
    {
        public Guid UnidadAdministrativaId { get; set; }


        public Guid ServicioId { get; set; }

        public string Servicio { get; set; }
         
        public Guid UsuarioId { get; set; }

        public bool PorDefecto { get; set; }

        public bool PoseeFirmaElectronica { get; set; }
    }

    public class ObtenerSignatarioInput {

        //[Required]
        //public Guid UnidadAdministrativaId { get; set; }


        public Guid? ServicioId { get; set; }

 
        public Guid? UsuarioId { get; set; }

        public bool? PoseeFirmaElectronica { get; set; }
    }

    public class CrearSignatarioDto
    {
        [Required]
        public Guid ServicioId { get; set; }

        [Required]
        public Guid UsuarioId { get; set; }

        public bool PorDefecto { get; set; }

    }
}
