using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class ArancelDto : IEntityDto<Guid>
    {
        public Guid Id { get; set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxDescriptionLength)]
        public virtual string Descripcion { get; set; }

        [Required]
        public string MonedaId { get; set; }

        public string Moneda { get; set; }

        [Required]
        public bool Activo { get; set; }

    }

    public class ArancelLookupDto : EntityDto<Guid>
    {
        public virtual string Descripcion { get; set; }
    }
}
