using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using System.Linq;
using System.Linq.Dynamic.Core;
using Volo.Abp.Auditing;
using Volo.Abp;
using Mre.Sb.AdministrativeUnit.Permissions;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{

    public class PartidaArancelariaServicioAppService : ApplicationService, IPartidaArancelariaServicioAppService
    {
        private readonly IRepository<PartidaArancelariaServicio> _partidaServicioRepository;
        private readonly IRepository<PartidaArancelaria> _partidaRepository;
        private readonly IRepository<JerarquiaArancelaria> _jerarquiaRepository;
        private readonly IRepository<Arancel> _arancelRepository;
        private readonly IRepository<Dominio.Servicio> _servicioRepository;

        public PartidaArancelariaServicioAppService(
            IRepository<PartidaArancelariaServicio> partidaServicioRepository,
            IRepository<PartidaArancelaria> partidaRepository,
            IRepository<JerarquiaArancelaria> jerarquiaRepository,
            IRepository<Arancel> arancelRepository,
            IRepository<Dominio.Servicio> servicioRepository
            )
        {
            _partidaServicioRepository = partidaServicioRepository;
            _partidaRepository = partidaRepository;
            _jerarquiaRepository = jerarquiaRepository;
            _arancelRepository = arancelRepository;
            _servicioRepository = servicioRepository;
        }

        public async Task<ListResultDto<PartidaArancelariaServicioDto>> ObtenerPartidaArancelariaPorServicioAsync(Guid servicioId)
        {
            var queryPartidaServicio = await _partidaServicioRepository.GetQueryableAsync();
            queryPartidaServicio = queryPartidaServicio.Where(a => a.ServicioId == servicioId);

            var queryServicio = await _servicioRepository.GetQueryableAsync();
            queryServicio = queryServicio.Where(a => a.Id == servicioId);

            var queryPartida = await _partidaRepository.GetQueryableAsync();

            var queryJerarquia = await _jerarquiaRepository.GetQueryableAsync();

            var queryArancel = await _arancelRepository.GetQueryableAsync();
            queryArancel = queryArancel.Where(x => x.Activo);

            var queryDto = from entity in queryPartidaServicio
                           join servicio in queryServicio
                           on entity.ServicioId equals servicio.Id
                           join partida in queryPartida
                           on entity.PartidaArancelariaId equals partida.Id
                           join jerarquia in queryJerarquia
                           on partida.JerarquiaArancelariaId equals jerarquia.Id
                           join arancel in queryArancel
                           on jerarquia.ArancelId equals arancel.Id
                           select new PartidaArancelariaServicioDto
                           {
                               ServicioId = servicio.Id,
                               Servicio = servicio.Nombre,
                               PartidaArancelariaId = entity.PartidaArancelariaId,
                               PartidaArancelaria = partida.Descripcion,
                               NumeroPartida = partida.NumeroPartida,
                               Valor = partida.Valor,
                               JerarquiaArancelariaId = jerarquia.Id,
                               JerarquiaArancelaria = jerarquia.Descripcion,
                               ArancelId = arancel.Id,
                               Arancel = arancel.Descripcion
                           };


            var resultadoDto = await AsyncExecuter.ToListAsync(queryDto);

            return new ListResultDto<PartidaArancelariaServicioDto>(resultadoDto);

        }

    }

}
