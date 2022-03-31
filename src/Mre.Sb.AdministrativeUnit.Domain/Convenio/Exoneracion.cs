using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Volo.Abp.Domain.Entities;
using Volo.Abp.Domain.Entities.Auditing;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{

    /// <summary>
    /// Clase para establecer exoneraciones a servicios segun un convenio
    /// </summary>
    public class Exoneracion : Entity
    {

        [Required]
        public Guid ConvenioId { get; set; }

        [Required]
        public Guid ServicioId { get; set; }

        [Required]
        public virtual decimal Valor { get; set; }

        [StringLength(DomainCommonConsts.MaxGeographicalIdLength)]
        public string PaisId { get; set; }

        public int? EdadInicial { get; set; }

        public int? EdadFinal { get; set; }

        public bool? Discapacitado { get; set; }


        [Required]
        public string TipoExoneracionId { get; set; }

        public TipoExoneracion TipoExoneracion { get; set; }

        public string EntidadAuspicianteId { get; set; }

        public EntidadAuspiciante EntidadAuspiciante { get; set; }


        public Exoneracion(Guid convenioId,
            Guid servicioId,
            decimal valor,
            string tipoExoneracionId,
            string entidadAuspicianteId,
            string paisId,
            int? edadInicial,
            int? edadFinal,
            bool? discapacitado)
        {
            ConvenioId = convenioId;
            ServicioId = servicioId;
            Valor = valor;
            TipoExoneracionId = tipoExoneracionId;
            EntidadAuspicianteId = entidadAuspicianteId;
            PaisId = paisId;
            EdadInicial = edadInicial;
            EdadFinal = edadFinal;
            Discapacitado = discapacitado;
        }

        public override object[] GetKeys()
        {
            return new object[] { ConvenioId, ServicioId };
        }
    }
}
