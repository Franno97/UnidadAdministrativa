using System.ComponentModel.DataAnnotations;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    public class TipoAtencion : Entity<string>
    {
        [Required]
        [StringLength(DomainCommonConsts.MaxIdLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public override string Id { get; protected set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string Nombre { get; set; }

        protected TipoAtencion()
        {

        }

        public TipoAtencion(string id)
         : base(id)
        {

        }
    }
}
