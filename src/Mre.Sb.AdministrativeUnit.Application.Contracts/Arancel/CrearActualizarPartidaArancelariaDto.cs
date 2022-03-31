using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.ComponentModel.DataAnnotations;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class CrearActualizarPartidaArancelariaDto 
    {

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
}
