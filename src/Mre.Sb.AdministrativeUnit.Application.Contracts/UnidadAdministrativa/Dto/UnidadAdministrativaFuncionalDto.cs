using System;
using System.Collections.Generic;
using System.Text;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public class UnidadAdministrativaFuncionalDto
    {
        public Guid UsuarioId { get; set; }

        public string Nombre { get; set; }

        public string Apellido { get; set; }

        public string Cargo { get; set; }
    }

    public class FuncionarioInfoDto
    {
        public Guid UsuarioId { get; set; }

    }

    public class FuncionarioInfoExtendido: FuncionarioInfoDto
    {

        public string Cargo { get; set; }

        public string Ciudad { get; set; }

        public Guid UnidadAdministrativaId { get; set; }

        public string UnidadAdministrativaNombre { get; set; }

        public string UnidadAdministrativaPaisId { get; set; }

        public string UnidadAdministrativaSiglas { get; set; }

    }
}
