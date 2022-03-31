using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Volo.Abp;
using Volo.Abp.Domain.Entities;
using Volo.Abp.Domain.Entities.Auditing;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{

    /// <summary>
    /// Clase para informacion de Partida arancelaria
    /// </summary>
    public class PartidaArancelaria : AuditedAggregateRoot<Guid>
    {
        [Required]
        public Guid JerarquiaArancelariaId { get; set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxDescriptionLength)]
        public virtual string Descripcion { get; set; }

        [Required]
        [StringLength(TariffHeadingConsts.MaxTariffHeadingHeadingNumberLength)]
        public virtual string NumeroPartida { get; set; }

        [Required]
        public virtual decimal Valor { get; set; }

        public virtual ICollection<PartidaArancelariaServicio> Servicios { get; protected set; }

        protected PartidaArancelaria()
        {

        }
        public PartidaArancelaria(Guid id, Guid jerarquiaArancelariaId, string descripcion, string numeroPartida, decimal valor)
        {
            Id = id;
            JerarquiaArancelariaId = jerarquiaArancelariaId;
            Descripcion = descripcion;
            NumeroPartida = numeroPartida;
            Valor = valor;
             
            Servicios = new List<PartidaArancelariaServicio>();
        }

        public void ChangeDescription(string nuevaDescripcion)
        {
            this.Descripcion = nuevaDescripcion;
        }

        public void AddService(Guid serviceId)
        {
            Check.NotNull(serviceId, nameof(serviceId));

            Servicios.Add(new PartidaArancelariaServicio(this.Id, serviceId));
        }

        public void RemoveService(Guid serviceId)
        {
            Servicios.RemoveAll(s => s.ServicioId == serviceId);

        }
    }
}
