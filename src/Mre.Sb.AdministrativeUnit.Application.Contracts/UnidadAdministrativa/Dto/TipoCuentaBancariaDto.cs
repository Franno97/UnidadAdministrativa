using Mre.Sb.UnidadAdministrativa.Dominio;
using System.ComponentModel.DataAnnotations;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public class TipoCuentaBancariaDto : IEntityDto<string>
    {
        [Required]
        [StringLength(TipoCuentaBancariaConsts.MaxTipoCuentaBancariaIdLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public string Id { get; set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string Nombre { get; set; }

    }
}
