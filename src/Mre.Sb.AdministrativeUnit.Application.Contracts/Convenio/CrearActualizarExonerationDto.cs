using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.ComponentModel.DataAnnotations;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class CrearExoneracionDto
    {

        [Required]
        public Guid ServicioId { get; set; }

        [Required]
        public virtual decimal Valor { get; set; }

        [Required]
        public virtual string TipoExoneracionId { get; set; }

        public string EntidadAuspicianteId { get; set; }

        public string PaisId { get; set; }

        public int? EdadInicial { get; set; }

        public int? EdadFinal { get; set; }

        public bool? Discapacitado { get; set; }


    }

    public class ActualizarExoneracionDto
    {

        [Required]
        public virtual decimal Valor { get; set; }

        [Required]
        public virtual string TipoExoneracionId { get; set; }

        public string EntidadAuspicianteId { get; set; }

        public string PaisId { get; set; }

        public int? EdadInicial { get; set; }

        public int? EdadFinal { get; set; }

        public bool? Discapacitado { get; set; }


    }

}
