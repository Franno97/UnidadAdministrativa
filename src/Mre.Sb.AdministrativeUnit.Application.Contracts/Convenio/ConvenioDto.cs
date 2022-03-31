using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.ComponentModel.DataAnnotations;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class ConvenioDto : IEntityDto<Guid>
    {
        
        public Guid Id { get; set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxDescriptionLength)]
        public virtual string Descripcion { get; set; }

        [Required]
        public virtual DateTime FechaCreacion { get; set; }

        public virtual DateTime? FechaExpiracion { get; set; }
    }

    public class ConvenioLookupDto : EntityDto<Guid>
    {
        public virtual string Descripcion { get; set; }
    }
}
