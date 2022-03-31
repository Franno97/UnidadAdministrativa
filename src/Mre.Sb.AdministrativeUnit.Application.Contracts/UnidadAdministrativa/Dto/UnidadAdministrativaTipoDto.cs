using Mre.Sb.UnidadAdministrativa.Dominio;
using System.ComponentModel.DataAnnotations;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public class UnidadAdministrativaTipoDto : IEntityDto<string>
    {

        [Required]
        [StringLength(AdministrativeUnitTypeConsts.MaxIdLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public  string Id { get;  set; }


        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public virtual string Nombre { get; set; }
    }

    public class UnidadAdministrativaTipoInfoDto : EntityDto<string>
    {
        public string Nombre { get; set; }
    }

}
