using System.ComponentModel.DataAnnotations;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    /// <summary>
    /// Entidad para administrar un tipo de arancel
    /// </summary>
    public class TipoArancel : Entity<string>
    {
        [Required]
        [StringLength(TariffTypeConsts.MaxTariffTypeIdLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public override string Id { get; protected set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string Nombre { get; set; }

        protected TipoArancel()
        {

        }

        public TipoArancel(string id)
         : base(id)
        {

        }
    }
}
