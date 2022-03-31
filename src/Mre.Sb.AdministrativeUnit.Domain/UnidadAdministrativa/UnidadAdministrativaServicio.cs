using System;
using System.ComponentModel.DataAnnotations;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    public class UnidadAdministrativaServicio : Entity
    {
        protected UnidadAdministrativaServicio()
        {

        }

        public UnidadAdministrativaServicio(
            Guid administrativeUnitId,
            Guid serviceId,
            string paymentTypeId,
            bool isActive)
        {
            UnidadAdministrativaId = administrativeUnitId;
            ServicioId = serviceId;
            TipoPagoId = paymentTypeId;
            Activo = isActive;
        }

        [Required]
        public Guid UnidadAdministrativaId { get;  set; }

        [Required]
        public Guid ServicioId { get; set; }

        [Required]
        public string TipoPagoId { get; set; }

        public TipoPago TipoPago { get; set; }

        [Required]
        public bool Activo { get; set; }

        public override object[] GetKeys()
        {
            return new object[] { UnidadAdministrativaId, ServicioId };
        }

    }

}
