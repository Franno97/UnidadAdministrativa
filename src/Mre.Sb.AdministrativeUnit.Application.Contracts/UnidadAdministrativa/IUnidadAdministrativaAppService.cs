using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Mre.Sb.UnidadAdministrativa.Servicio;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{

    public interface IUnidadAdministrativaAppService :
       ICrudAppService<UnidadAdministrativaDto,
           Guid,
           GetUnidadAdministrativaInput,
           CrearActualizarUnidadAdministrativaDto>
    {

        Task<UnidadAdministrativaDto> ObtenerPorCodigoAsync(string codigo);

        Task<ListResultDto<UnidadAdministrativaInfoDto>> GetLookupAdministrativeUnitAsync();

        Task<ListResultDto<UnidadAdministrativaInfoDto>> ObtenerUnidadAdministrativaPorServicioAsync(Guid servicioId);

        public Task<ListResultDto<UnidadAdministrativaInfoDto>> ObtenerUnidadAdminsitrativaPorPaisAsync(string codigoPais);

        public Task<ListResultDto<UnidadAdministrativaInfoDto>> ObtenerUnidadAdministrativaPorServicioPaisAsync(Guid servicioId, string codigoPais);

        public Task<ListResultDto<UnidadAdministrativaInfoDto>> ObtenerUnidadAdministrativaPorCiudadJurisdiccionAsync(string ciudad);



        /// <summary>
        /// Obtiene las unidades administrativas por lista de Id
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        Task<ListResultDto<UnidadAdministrativaInfoDto>> ObtenerPorListaIds(List<Guid> ids);

        Task CambiarEstadoAsync(Guid unidadAdministrativaId, bool activo);

       
        public Task AssignMissionChiefAsync(Guid unidadAdministrativaId, Guid userId);


        Task AgregarFuncionalAsync(Guid unidadAdministrativaId, AgregarFuncionarioDto input);


        public Task<PagedResultDto<UnidadAdministrativaFuncionalDto>> ObtenerFuncionalesAsync(Guid unidadAdministrativaId);


        public Task EliminarFuncionalAsync(Guid unidadAdministrativaId, Guid userId);



        #region Servicio
        public Task<ListResultDto<ServicioDto>> ObtenerServiciosPorTipoDeServicioAsync(Guid administrativeUnitId, string tipoServicioId);

        public Task<PagedResultDto<UnidadAdministrativaServicioDto>> ObtenerServiciosAsync(Guid unidadAdministrativaId, GetUnidadAdministrativaServicioInput input);


        public Task<UnidadAdministrativaServicioDto> ObtenerServicioAsync(Guid unidadAdministrativaId, Guid servicioId);

        public Task<UnidadAdministrativaServicioDto> AgregarServicioAsync(Guid unidadAdministrativaId, CrearUnidadAdministrativaServicioDto input);

        public Task<UnidadAdministrativaServicioDto> ActualizarServicioAsync(Guid unidadAdministrativaId, Guid servicioId, ActualizarUnidadAdministrativaServicioDto input);

        public Task EliminarServicioAsync(Guid unidadAdministrativaId, Guid servicioId);

        public Task<ListResultDto<ServicioDto>> GetLookupAsync(Guid unidadAdministrativaId);

        public Task<ListResultDto<ServicioDto>> ObtenerServiciosPorUnidadAdministrativa(Guid unidadAdministrativaId);

        #endregion Servicio


        #region Signatario
        
        public Task<PagedResultDto<SignatarioDto>> ObtenerSignatariosAsync(Guid unidadAdministrativaId);

        public Task<ListResultDto<SignatarioDto>> BuscarSignatariosAsync(Guid unidadAdministrativaId,ObtenerSignatarioInput input);
         
        public Task AgregarSignatarioAsync(Guid unidadAdministrativaId, CrearSignatarioDto input);

        public Task EliminarSignatarioAsync(Guid unidadAdministrativaId, Guid userId, Guid servicioId);

        #endregion Signatario


        
     
    }


}
