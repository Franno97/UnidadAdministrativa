using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.Linq;
using System.Threading.Tasks;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using System.Linq.Dynamic.Core;
using Microsoft.Extensions.Localization;
using Mre.Sb.AdministrativeUnit.Localization;
using Microsoft.AspNetCore.Authorization;
using Mre.Sb.AdministrativeUnit.Permissions;
using Volo.Abp.Users;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public class UnidadAdministrativaFuncional : ApplicationService, IUnidadAdministrativaFuncional
    {
        public IRepository<UnidadAdministrativaFuncionario> AdministrativeUnitFunctionaries { get; }
        public IRepository<Dominio.UnidadAdministrativa, Guid> AdministrativeUnits { get; }
        public IStringLocalizer<AdministrativeUnitResource> Localizer { get; }
      

        public UnidadAdministrativaFuncional(
            IRepository<UnidadAdministrativaFuncionario> administrativeUnitFunctionaries,
            IRepository<Dominio.UnidadAdministrativa, Guid> administrativeUnits,
            IStringLocalizer<AdministrativeUnitResource> localizer)
        {
            AdministrativeUnitFunctionaries = administrativeUnitFunctionaries;
            AdministrativeUnits = administrativeUnits;
            Localizer = localizer;
        }


        [Authorize(AdministrativeUnitPermissions.AdministrativeUnit.Default)]
        public async Task<UnidadAdministrativaInfoDto> ObtenerUnidadAdministrativaDelFuncionalAsync(Guid usuarioId)
        {
            return await ObtenerUnidadAdminsitrativaDelFuncionalPorIdAsync(usuarioId);
        }


        [Authorize(AdministrativeUnitPermissions.AdministrativeUnit.Default)]
        public async Task<UnidadAdministrativaInfoDto> ObtenerUnidadAdministrativaDelFuncionalActualAsync()
        {
            //Obtener el usuario actual
            var usuarioId = CurrentUser.Id;
            if (usuarioId == null)
            {
                return null;
            }

            return await ObtenerUnidadAdminsitrativaDelFuncionalPorIdAsync(usuarioId.Value);
        }

        public async Task<PagedResultDto<FuncionarioInfoDto>> ObtenerFuncionariosPorUnidadAdministrativaAsync(Guid unidadAdministrativaId)
        {
            var consultaUnidadFuncionario = await AdministrativeUnitFunctionaries.GetQueryableAsync();
            consultaUnidadFuncionario = consultaUnidadFuncionario.Where(x => x.UnidadAdministrativaId == unidadAdministrativaId);

            var totalCount = await AsyncExecuter.CountAsync(consultaUnidadFuncionario);

            var consultaDto = consultaUnidadFuncionario.Select(entidad => new FuncionarioInfoDto()
            {
                UsuarioId = entidad.UsuarioId,
            });

            var entidadDtos = await AsyncExecuter.ToListAsync(consultaDto);

            return new PagedResultDto<FuncionarioInfoDto>(
                totalCount,
                entidadDtos
            );
        }


        private async Task<UnidadAdministrativaInfoDto> ObtenerUnidadAdminsitrativaDelFuncionalPorIdAsync(Guid usuarioId)
        {
            var consultaUnidadFuncionales = await AdministrativeUnitFunctionaries.GetQueryableAsync();
            var consultaUnidad = await AdministrativeUnits.GetQueryableAsync();

            var consulta = from unidadFuncional in consultaUnidadFuncionales
                           join unidad in consultaUnidad on unidadFuncional.UnidadAdministrativaId equals unidad.Id
                           where unidadFuncional.UsuarioId == usuarioId
                           select new UnidadAdministrativaInfoDto
                           {
                               Id = unidad.Id,
                               PaisId = unidad.PaisId,
                               Nombre = unidad.Nombre,
                               Siglas = unidad.Siglas,
                               Codigo = unidad.Codigo
                           };

            return await AsyncExecuter.SingleOrDefaultAsync(consulta);
        }

        public async Task<FuncionarioInfoExtendido> ObtenerFuncionarioPorUsuarioIdAsync(Guid usuarioId)
        {
            var consultaUnidadFuncionales = await AdministrativeUnitFunctionaries.GetQueryableAsync();
            var consultaUnidad = await AdministrativeUnits.GetQueryableAsync();

            var consulta = from unidadFuncional in consultaUnidadFuncionales
                           join unidad in consultaUnidad on unidadFuncional.UnidadAdministrativaId equals unidad.Id
                           where unidadFuncional.UsuarioId == usuarioId
                           select new FuncionarioInfoExtendido
                           {
                               UsuarioId = unidadFuncional.UsuarioId,
                               Cargo = unidadFuncional.Cargo.Nombre,
                               Ciudad = unidad.Ciudad,
                               UnidadAdministrativaId = unidad.Id,
                               UnidadAdministrativaNombre = unidad.Nombre,
                               UnidadAdministrativaPaisId = unidad.PaisId,
                               UnidadAdministrativaSiglas = unidad.Siglas
                           };

            return await AsyncExecuter.SingleOrDefaultAsync(consulta);
        }
    }


}
