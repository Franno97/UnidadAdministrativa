using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    [RemoteService(Name = AdministrativeUnitRemoteServiceConsts.RemoteServiceName)]
    [Area("UnidadAdministrativa")]
    [Route("api/unidad-administrativa/unidad-administrativa-funcional")]
    [Authorize]
    public class UnidadAdministrativaFuncionalController : AdministrativeUnitBaseController, IUnidadAdministrativaFuncional
    {
        public IUnidadAdministrativaFuncional UnidadAdministrativaFuncional { get; }

        public UnidadAdministrativaFuncionalController(IUnidadAdministrativaFuncional unidadAdministrativaFuncional)
        {
            UnidadAdministrativaFuncional = unidadAdministrativaFuncional;
        }

        [HttpGet]
        public Task<UnidadAdministrativaInfoDto> ObtenerUnidadAdministrativaDelFuncionalAsync(Guid usuarioId)
        {
            return UnidadAdministrativaFuncional.ObtenerUnidadAdministrativaDelFuncionalAsync(usuarioId);
        }

        [HttpGet]
        [Route("actual")]
        public Task<UnidadAdministrativaInfoDto> ObtenerUnidadAdministrativaDelFuncionalActualAsync()
        {
            return UnidadAdministrativaFuncional.ObtenerUnidadAdministrativaDelFuncionalActualAsync();
        }


        [HttpGet]
        [Route("funcionarios/{unidadAdministrativaId}")]
        public Task<PagedResultDto<FuncionarioInfoDto>> ObtenerFuncionariosPorUnidadAdministrativaAsync(Guid unidadAdministrativaId)
        {
            return UnidadAdministrativaFuncional.ObtenerFuncionariosPorUnidadAdministrativaAsync(unidadAdministrativaId);
        }

        [HttpGet]
        [Route("funcionario/{usuarioId}")]
        public Task<FuncionarioInfoExtendido> ObtenerFuncionarioPorUsuarioIdAsync(Guid usuarioId)
        {
            return UnidadAdministrativaFuncional.ObtenerFuncionarioPorUsuarioIdAsync(usuarioId);
        }
    }
}
