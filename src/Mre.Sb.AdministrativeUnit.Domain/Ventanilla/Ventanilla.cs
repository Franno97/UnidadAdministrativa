using System;
using System.ComponentModel.DataAnnotations;
using Volo.Abp.Domain.Entities.Auditing;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    /// <summary>
    /// Entidad Ventanilla para administrar la informacion de una ventanilla de la unidad administrativa
    /// #issues/25
    /// </summary>
    public class Ventanilla : AuditedAggregateRoot<Guid>
    {
        protected Ventanilla()
        {

        }

        public Ventanilla(Guid id, Guid admiministrativeUnitId, string name, bool isPresentialAttention, bool isVirtualAttention, string attentionStart, string attentionEnd, bool isActive)
        {
            Id = id;
            UnidadAdministrativaId = admiministrativeUnitId;
            Nombre = name;
            AtencionPresencial = isPresentialAttention;
            AtencionVirtual = isVirtualAttention;
            InicioAtencion = attentionStart;
            FinAtencion = attentionEnd;
            Activo = isActive;

        }

        [Required]
        public Guid UnidadAdministrativaId { get; set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string Nombre { get; set; }

        public bool AtencionPresencial { get; set; }

        public bool AtencionVirtual { get; set; }

        public string InicioAtencion { get; set; }

        public string FinAtencion { get; set; }

        public bool Activo { get; set; }

        public void ChangeName(string newName)
        {
            this.Nombre = newName;
        }

        public void ChangeIsActive(bool newIsActive)
        {
            this.Activo = newIsActive;
        }

    }
}
