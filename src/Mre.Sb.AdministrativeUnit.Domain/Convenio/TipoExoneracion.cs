using System.ComponentModel.DataAnnotations;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    /// <summary>
    /// Entidad para administrar un tipo de exoneracion
    /// </summary>
    public class TipoExoneracion : Entity<string>
    {
        [Required]
        [StringLength(TipoExoneracionConsts.MaxTipoExoneracionIdLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public override string Id { get; protected set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string Nombre { get; set; }

        protected TipoExoneracion()
        {

        }

        public TipoExoneracion(string id)
         : base(id)
        {

        }
    }
}
