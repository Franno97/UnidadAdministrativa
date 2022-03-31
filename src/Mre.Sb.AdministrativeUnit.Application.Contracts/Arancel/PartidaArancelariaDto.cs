using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class PartidaArancelariaDto : IEntityDto<Guid>
    {
        public Guid Id { get; set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxDescriptionLength)]
        public virtual string Descripcion { get; set; }

        [Required]
        [StringLength(TariffHeadingConsts.MaxTariffHeadingHeadingNumberLength)]
        public virtual string NumeroPartida { get; set; }

        [Required]
        public virtual decimal Valor { get; set; }

        [Required]
        public virtual Guid JerarquiaArancelariaId { get; set; }

    }

    public class PartidaArancelariaLookupDto : EntityDto<Guid>
    {
        public virtual string Descripcion { get; set; }
    }
}
