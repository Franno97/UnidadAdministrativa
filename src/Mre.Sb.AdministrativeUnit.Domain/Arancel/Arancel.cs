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
    /// Clase para informacion de aranceles
    /// </summary>
    public class Arancel : AuditedAggregateRoot<Guid>
    {
        [Required]
        [StringLength(DomainCommonConsts.MaxDescriptionLength)]
        public virtual string Descripcion { get; set; }

        [Required]
        public string MonedaId { get; set; }

        public Moneda Moneda { get; set; }

        [Required]
        public bool Activo { get; protected set; }


        public virtual ICollection<JerarquiaArancelaria> Jerarquias { get; protected set; }


        protected Arancel()
        {
            Jerarquias = new List<JerarquiaArancelaria>();
        }

        public Arancel(Guid id, string descripcion, string monedaId, bool activo = true)
        {
            Id = id;
            Descripcion = descripcion;
            MonedaId = monedaId;
            Activo = activo;

            Jerarquias = new List<JerarquiaArancelaria>();
        }

        public void CambiarDescripcion(string nuevaDescripcion)
        {
            this.Descripcion = nuevaDescripcion;
        }

        public void CambiarEstadoActivo(bool activo)
        {
            this.Activo = activo;
        }



        #region Jerarquia Arancelaria

        public void AgregarJerarquia(Guid id, string tipoArancelId, string descripcion, int orden, int numeroJerarquia)
        {
            Check.NotNull(id, nameof(id));

            Jerarquias.Add(new JerarquiaArancelaria(id, this.Id, tipoArancelId, descripcion, orden, numeroJerarquia));
        }


        public void QuitarJerarquia(Guid jerarquiaArancelariaId)
        {
            Jerarquias.RemoveAll(s => s.Id == jerarquiaArancelariaId);

        }

        #endregion Jerarquia Arancelaria
    }
}
