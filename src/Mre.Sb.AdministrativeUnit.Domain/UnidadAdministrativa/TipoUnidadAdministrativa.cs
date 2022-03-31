using System;
using System.ComponentModel.DataAnnotations;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    public class TipoUnidadAdministrativa : Entity<string>
    {

        [Required]
        [StringLength(AdministrativeUnitTypeConsts.MaxIdLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public override string Id { get; protected set; }


        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public virtual string Nombre { get; set; }


        protected TipoUnidadAdministrativa()
        {

        }

        public TipoUnidadAdministrativa(string id)
         : base(id)
        {

        }
    }


    

}
