using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    /// <summary>
    /// Entidad nivel para identificar el nivel que tiene una unidad administrativa
    /// </summary>
    public class Nivel : Entity<string>
    {
        [Required]
        [StringLength(LevelConsts.MaxLevelIdLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public override string Id { get; protected set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string Nombre { get; set; }

        protected Nivel()
        {

        }

        public Nivel(string id)
         : base(id)
        {

        }
    }
}
