using Mre.Sb.UnidadAdministrativa.Dominio;
using System.ComponentModel.DataAnnotations;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public class NivelDto : IEntityDto<string>
    {
        [Required]
        [StringLength(LevelConsts.MaxLevelIdLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public string Id { get;  set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string Nombre { get; set; }

       
    }

    public class NivelLookupDto : EntityDto<string>
    {
        public string Nombre { get; set; }
    }
}
