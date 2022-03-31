using System.ComponentModel.DataAnnotations;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    /// <summary>
    /// Entidad banco para asociar una cuenta de banco a una unidad administrativa
    /// </summary>
    public class Banco : Entity<string>
    {
        [Required]
        [StringLength(BankConsts.MaxBankIdLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public override string Id { get; protected set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string Nombre { get; set; }

   
        protected Banco()
        {

        }

        public Banco(string id)
         : base(id)
        {

        }
    }
}
