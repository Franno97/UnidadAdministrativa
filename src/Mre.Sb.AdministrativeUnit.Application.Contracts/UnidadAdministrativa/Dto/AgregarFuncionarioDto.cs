using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public class AgregarFuncionarioDto
    {
        [Required]
        public Guid UsuarioId { get; set; }

        [Required]
        public string CargoId { get; set; }
    }
}
