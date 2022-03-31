using System.ComponentModel.DataAnnotations;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    /// <summary>
    /// Entidad para adminsitrar el tipo de pago de un servicio consular
    /// </summary>
    public class TipoPago : Entity<string>
    {
        [Required]
        [StringLength(DomainCommonConsts.MaxIdLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public override string Id { get; protected set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string Nombre { get; set; }

        protected TipoPago()
        {

        }

        public TipoPago(string id)
         : base(id)
        {

        }
    }



}
