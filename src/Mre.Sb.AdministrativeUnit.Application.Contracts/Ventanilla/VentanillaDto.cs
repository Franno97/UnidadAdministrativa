using System;
using System.Collections.Generic;
using System.Text;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Ventanilla
{
    public class VentanillaDto : IEntityDto<Guid>
    {
        public Guid Id { get; set; }

        public Guid AdministrativeUnitId { get; set; }

        public string Name { get; set; }

        public bool IsPresentialAttention { get; set; }


        public bool IsVirtualAttention { get; set; }

        public string AttentionStart { get; set; }

        public string AttentionEnd { get; set; }

        public bool IsActive { get; set; }

    }
}
