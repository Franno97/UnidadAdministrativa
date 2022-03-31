using System.ComponentModel.DataAnnotations;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    /// <summary>
    /// Entidad tipo cuenta de cuenta bancaria que puede tener una unidad administrativa
    /// </summary>
    public class TipoCuentaBancaria : Entity<string>
    {
        [Required]
        [StringLength(TipoCuentaBancariaConsts.MaxTipoCuentaBancariaIdLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public override string Id { get; protected set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string Nombre { get; set; }

   
        protected TipoCuentaBancaria()
        {

        }

        public TipoCuentaBancaria(string id)
         : base(id)
        {

        }
    }
}
