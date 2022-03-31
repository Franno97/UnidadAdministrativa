using System;
using System.ComponentModel.DataAnnotations;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    /// <summary>
    /// Establecer las ciudades que conforman la jurisdiccion de una unidad administrativa
    /// </summary>
    public class Jurisdiccion: Entity 
    {
        public Jurisdiccion(Guid unidadAdministrativaId, string ciudad)
        {
            UnidadAdministrativaId = unidadAdministrativaId;
            Ciudad = ciudad.ToUpper();
        }

        [Required]
        public Guid UnidadAdministrativaId { get; set; }

       
        [Required]
        [StringLength(DomainCommonConsts.MaxAddressLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string Ciudad { get; set; }

        public override object[] GetKeys()
        {
            return new object[] { UnidadAdministrativaId, Ciudad };
        }


    }
}
