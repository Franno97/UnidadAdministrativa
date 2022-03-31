using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{

    /// <summary>
    /// Clase para informacion de partida arancelaria y servicios asociados
    /// </summary>
    public class PartidaArancelariaServicio : Entity
    {
        protected PartidaArancelariaServicio()
        {

        }

        public PartidaArancelariaServicio(Guid partidaArancelariaId, Guid servicioId)
        {
            PartidaArancelariaId = partidaArancelariaId;
            ServicioId = servicioId;
        }

        [Required]
        public Guid PartidaArancelariaId { get; set; }

        [Required]
        public Guid ServicioId { get; set; }


        public override object[] GetKeys()
        {
            return new object[] { PartidaArancelariaId, ServicioId };
        }
    }
}
