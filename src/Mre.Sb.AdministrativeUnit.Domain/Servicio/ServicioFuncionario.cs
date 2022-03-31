using System;
using System.ComponentModel.DataAnnotations;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    public class ServicioFuncionario : Entity
    {
        protected ServicioFuncionario()
        {

        }

        public ServicioFuncionario(Guid userId, Guid serviceId, string positionId)
        {
            UsuarioId = userId;
            ServicioId = serviceId;
            CargoId = positionId;
        }

        [Required]
        public Guid UsuarioId { get; set; }

        [Required]
        public Guid ServicioId { get; set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxIdLength)]
        public string CargoId { get; set; }

        public override object[] GetKeys()
        {
            return new object[] { ServicioId, UsuarioId };
        }
    }
}
