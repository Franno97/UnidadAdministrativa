using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.ComponentModel.DataAnnotations;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class ExonerationDto
    {

        [Required]
        public Guid ConvenioId { get; set; }

        [Required]
        public Guid ServicioId { get; set; }

        [Required]

        public string Servicio { get; set; }

        public string TipoServicio { get; set; }

        [Required]
        public virtual decimal Valor { get; set; }

        public string EntidadAuspicianteId { get; set; }

        public string EntidadAuspiciante { get; set; }

        [StringLength(DomainCommonConsts.MaxGeographicalIdLength)]
        public string PaisId { get; set; }

        public int? EdadInicial { get; set; }

        public int? EdadFinal { get; set; }

        public bool? Discapacitado { get; set; }

        [Required]
        public virtual string TipoExoneracionId { get; set; }

        public virtual string TipoExoneracion { get; set; }

    }

}
