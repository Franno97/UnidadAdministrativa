using System;
using System.ComponentModel.DataAnnotations;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    public class UnidadAdministrativaFuncionario : Entity {

        protected UnidadAdministrativaFuncionario()
        {

        }

        public UnidadAdministrativaFuncionario(Guid unidadAdministrativaId, Guid usuarioId, string cargoId)
        {
            UnidadAdministrativaId = unidadAdministrativaId;
            UsuarioId = usuarioId;
            CargoId = cargoId;
        }

        [Required]
        public Guid UnidadAdministrativaId { get; set; }

        [Required]
        public Guid UsuarioId { get; set; }

        [Required]
        public string CargoId { get; set; }

        public Cargo Cargo { get; set; }

        public override object[] GetKeys()
        {
            return new object[] { UnidadAdministrativaId, UsuarioId };
        }

    }

}
