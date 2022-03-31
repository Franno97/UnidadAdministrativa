using System.ComponentModel.DataAnnotations;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    /// <summary>
    /// Entidad para administrar entidades auspiciantes
    /// </summary>
    public class EntidadAuspiciante : Entity<string>
    {
        [Required]
        [StringLength(EntidadAuspicianteConsts.MaxEntidadAuspicianteIdLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public override string Id { get; protected set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string Nombre { get; set; }

        protected EntidadAuspiciante()
        {

        }

        public EntidadAuspiciante(string id)
         : base(id)
        {

        }
    }
}
