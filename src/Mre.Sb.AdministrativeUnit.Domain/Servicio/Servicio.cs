using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Volo.Abp.Domain.Entities.Auditing;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    /// <summary>
    /// Clase para administrar la informacion de un servicio consular
    /// </summary>
    public class Servicio : AuditedAggregateRoot<Guid>
    {
        protected Servicio()
        {

        }

        public Servicio(Guid id, string name, string serviceTypeId, bool isPresentialAttention, bool isSemipresentialAttention, bool isVirtualAttention, bool isActive=true)
        {
            Id = id;
            Nombre = name;
            TipoServicioId = serviceTypeId;
            AtencionPresencial = isPresentialAttention;
            AtencionSemiPresencial = isSemipresentialAttention;
            AtencionVirtual = isVirtualAttention;
            Activo = isActive;
        }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string Nombre { get; protected set; }

        public bool AtencionPresencial { get; set; }

        public bool AtencionSemiPresencial { get; set; }

        public bool AtencionVirtual { get; set; }

        [Required]
        public string TipoServicioId { get; set; }

        public TipoServicio TipoServicio { get; set; }

        [Required]
        public bool Activo { get; protected set; }


        public void ChangeName(string newName) {
            this.Nombre = newName;
        }

        public void ChangeIsActive(bool newIsActive)
        {
            this.Activo = newIsActive;
        }
    }

}
