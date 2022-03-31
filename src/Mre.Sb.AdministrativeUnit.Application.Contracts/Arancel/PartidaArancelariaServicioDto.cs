using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class PartidaArancelariaServicioDto : IEntityDto
    {
        public Guid PartidaArancelariaId { get; set; }

        public Guid ServicioId { get; set; }

        public virtual string Servicio { get; set; }

        public virtual string PartidaArancelaria { get; set; }

        public virtual string NumeroPartida { get; set; }
        
        public virtual decimal Valor { get; set; }

        public virtual Guid JerarquiaArancelariaId { get; set; }

        public virtual string JerarquiaArancelaria { get; set; }

        public virtual Guid ArancelId { get; set; }

        public virtual string Arancel { get; set; }

    }

}
