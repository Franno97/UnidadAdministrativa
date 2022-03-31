using System;
using System.Collections.Generic;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{

    public class UnidadAdministrativaInfoDto : EntityDto<Guid>
    {
        public virtual string Nombre { get; set; }

        public virtual string PaisId { get; set; }

        public virtual string Siglas { get; set; }

        public virtual string Codigo { get; set; }

    }
}
