using Mre.Sb.UnidadAdministrativa.Dominio;
using System.ComponentModel.DataAnnotations;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public class MonedaDto : IEntityDto<string>
    {
        [Required]
        [StringLength(CurrencyConsts.MaxCurrencyIdLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public  string Id { get;  set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string Nombre { get; set; }


        [StringLength(CurrencyConsts.MaxSimboloLength)]
        public string Simbolo { get; set; }
 
    }

    public class MonedaLookupDto : EntityDto<string>
    {
        public string Nombre { get; set; }
    }
}
