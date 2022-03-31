using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using Volo.Abp;
using Volo.Abp.Domain.Entities;
using Volo.Abp.Domain.Entities.Auditing;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{

    /// <summary>
    /// Clase para informacion de Jerarquia arancelaria
    /// </summary>
    public class JerarquiaArancelaria : AuditedAggregateRoot<Guid>
    {

        [Required]
        public Guid ArancelId { get; set; }

        [Required]
        public string TipoArancelId { get; set; }

        public TipoArancel TipoArancel { get; set; }


        [Required]
        [StringLength(DomainCommonConsts.MaxDescriptionLength)]
        public virtual string Descripcion { get; set; }

        [Required]
        public virtual int Orden { get; set; }

        public virtual int NumeroJerarquia { get; set; }


        public virtual ICollection<PartidaArancelaria> Partidas { get; protected set; }


        protected JerarquiaArancelaria()
        {
            Partidas = new List<PartidaArancelaria>();
        }

        public JerarquiaArancelaria(Guid id, Guid arancelId, string tipoArancelId, string descripcion, int orden, int numeroJerarquia)
        {
            Id = id;
            ArancelId = arancelId;
            TipoArancelId = tipoArancelId;
            Descripcion = descripcion;
            Orden = orden;
            NumeroJerarquia = numeroJerarquia;

            Partidas = new List<PartidaArancelaria>();
        }


        public void CambiarDescripcion(string nuevaDescripcion)
        {
            this.Descripcion = nuevaDescripcion;
        }


        #region Partida Arancelaria

        public void AgregarPartida(Guid id, string descripcion, string numeroPartida, decimal valor)
        {
            Check.NotNull(id, nameof(id));

            Partidas.Add(new PartidaArancelaria(id: id,
                jerarquiaArancelariaId: this.Id, 
                descripcion: descripcion, 
                numeroPartida: numeroPartida, 
                valor: valor));
        }


        public void QuitarPartida(Guid partidaArancelariaId)
        {
            Partidas.RemoveAll(s => s.Id == partidaArancelariaId);

        }

        #endregion Partida Arancelaria
    }
}
