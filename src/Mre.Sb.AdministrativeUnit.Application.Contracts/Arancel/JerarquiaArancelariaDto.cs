using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class JerarquiaArancelariaDto : IEntityDto<Guid>
    {
        public Guid Id { get; set; }

        [Required]
        public Guid ArancelId { get; set; }


        [Required]
        public virtual string TipoArancelId { get; set; }

        public virtual string TipoArancel { get; set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxDescriptionLength)]
        public virtual string Descripcion { get; set; }

        [Required]
        public virtual int Orden { get; set; }

        public virtual int NumeroJerarquia { get; set; }

    }

    public class JerarquiaArancelariaLookupDto : EntityDto<Guid>
    {
        public virtual string Descripcion { get; set; }
    }
}
