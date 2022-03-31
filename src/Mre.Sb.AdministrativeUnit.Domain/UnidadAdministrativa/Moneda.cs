using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    /// <summary>
    /// Entidad moneda que va asociada a una unidad administrativa
    /// </summary>
    public class Moneda : Entity<string>
    {
        [Required]
        [StringLength(CurrencyConsts.MaxCurrencyIdLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public override string Id { get; protected set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string Nombre { get; set; }


        [StringLength(CurrencyConsts.MaxSimboloLength)]
        public string Simbolo { get; set; }

        protected Moneda()
        {

        }

        public Moneda(string id)
         : base(id)
        {

        }
    }
}
