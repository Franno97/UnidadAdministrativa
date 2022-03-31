using System.ComponentModel.DataAnnotations;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    /// <summary>
    /// Entidad para administrar informacion del cargo de un funcionario
    /// </summary>
    public class Cargo : Entity<string>
    {
        protected Cargo()
        {

        }

        public Cargo(string id)
         : base(id)
        {

        }

        [Required]
        [StringLength(DomainCommonConsts.MaxIdLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public override string Id { get; protected set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string Nombre { get; set; }
    }
}
