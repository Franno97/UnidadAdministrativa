using System;
using System.ComponentModel.DataAnnotations;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    /// <summary>
    /// Entity for signers
    /// </summary>
    public class Signatario : Entity {
        protected Signatario()
        {

        }

        public Signatario(Guid administrativeUnitId, Guid userId, Guid serviceId, bool porDefecto=false)
        {
            UnidadAdministrativaId = administrativeUnitId;
            UsuarioId = userId;
            ServicioId = serviceId;
            PorDefecto = porDefecto;
        }

        [Required]
        public Guid UnidadAdministrativaId { get; set; }

        [Required]
        public Guid UsuarioId { get; set; }

        [Required]
        public Guid ServicioId { get; set; }

        /// <summary>
        /// Indica que el funcionario es signatario por defecto para todos los servicios
        /// </summary>
        public virtual bool PorDefecto { get; set; }


        public override object[] GetKeys()
        {
            return new object[] { UnidadAdministrativaId, UsuarioId, ServicioId };
        }

    }

}
