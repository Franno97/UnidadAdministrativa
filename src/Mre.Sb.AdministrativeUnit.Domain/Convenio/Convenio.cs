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
    /// Clase para informacion de Convenios
    /// </summary>
    public class Convenio : AuditedAggregateRoot<Guid>
    {

        [Required]
        [StringLength(DomainCommonConsts.MaxDescriptionLength)]
        public virtual string Descripcion { get; set; }

        [Required]
        public virtual DateTime FechaCreacion { get; set; }

        public virtual DateTime? FechaExpiracion { get; set; }

        public virtual ICollection<Exoneracion> Exoneraciones { get; protected set; }

        protected Convenio()
        {

        }

        public Convenio(Guid id, string description, DateTime creationDate, DateTime? expirationDate)
        {
            Id = id;
            Descripcion = description;
            FechaCreacion = creationDate;
            FechaExpiracion = expirationDate;

            Exoneraciones = new List<Exoneracion>();
        }

        public void ChangeDescription(string newDescription)
        {
            this.Descripcion = newDescription;
        }

        public void AddExoneration(Guid serviceId,
            decimal value,
            string tipoExoneracionId,
            string entidadAuspicianteId,
            string paisId,
            int? edadInicial,
            int? edadFinal,
            bool? discapacitado)
        {
            Check.NotNull(serviceId, nameof(serviceId));
            Check.NotNull(value, nameof(value));

            Exoneraciones.Add(new Exoneracion(this.Id,
                serviceId,
                value,
                tipoExoneracionId,
                entidadAuspicianteId,
                paisId,
                edadInicial,
                edadFinal,
                discapacitado));
        }

        public void RemoveExoneration(Guid serviceId)
        {
            Exoneraciones.RemoveAll(s => s.ServicioId == serviceId);

        }
    }
}
