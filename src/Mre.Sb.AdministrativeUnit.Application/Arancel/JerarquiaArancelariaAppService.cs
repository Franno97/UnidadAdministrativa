using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using System.Linq;
using Volo.Abp.Domain.Entities;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{

    public class JerarquiaArancelariaAppService :
      CrudAppService<
          JerarquiaArancelaria,
          JerarquiaArancelariaDto,
          Guid,
          GetJerarquiaArancelariaInput,
          CrearActualizarJerarquiaArancelariaDto>,
      IJerarquiaArancelariaAppService
    {
        private readonly IRepository<PartidaArancelaria> PartidaRepository;
        private readonly JerarquiaArancelariaManager JerarquiaArancelariaManager;

        public JerarquiaArancelariaAppService(
            IRepository<JerarquiaArancelaria, Guid> repository,
            IRepository<PartidaArancelaria> partidaRepository,
            JerarquiaArancelariaManager jerarquiaArancelariaManager)
            : base(repository)
        {
            this.PartidaRepository = partidaRepository;
            this.JerarquiaArancelariaManager = jerarquiaArancelariaManager;

            //GetPolicyName = AdministrativeUnitPermissions.TariffHierarchy.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.TariffHierarchy.Default;
            //CreatePolicyName = AdministrativeUnitPermissions.TariffHierarchy.Create;
            //UpdatePolicyName = AdministrativeUnitPermissions.TariffHierarchy.Update;
            //DeletePolicyName = AdministrativeUnitPermissions.TariffHierarchy.Delete;
        }

        public async Task<ListResultDto<JerarquiaArancelariaLookupDto>> GetLookupAsync()
        {
            await CheckGetListPolicyAsync();

            var list = await Repository.GetListAsync();

            return new ListResultDto<JerarquiaArancelariaLookupDto>(
                ObjectMapper.Map<List<JerarquiaArancelaria>, List<JerarquiaArancelariaLookupDto>>(list)
            );
        }
        

        #region Partida Arancelaria


        public async Task<PartidaArancelariaDto> ActualizarPartidaArancelariaAsync(Guid jerarquiaArancelariaId, Guid partidaArancelariaId, CrearActualizarPartidaArancelariaDto input)
        {
            await CheckUpdatePolicyAsync();

            var queryable = await Repository
                        .WithDetailsAsync(p => p.Partidas);

            queryable = queryable.Where(p => p.Id == jerarquiaArancelariaId);

            var jerarquia = await AsyncExecuter.SingleOrDefaultAsync(queryable);
            if (jerarquia == null)
            {
                throw new EntityNotFoundException(typeof(Mre.Sb.UnidadAdministrativa.Dominio.JerarquiaArancelaria), jerarquiaArancelariaId);
            }

            var partida = jerarquia.Partidas.SingleOrDefault(p => p.Id == partidaArancelariaId);
            if (partida == null)
            {
                throw new EntityNotFoundException(typeof(Mre.Sb.UnidadAdministrativa.Dominio.PartidaArancelaria), partidaArancelariaId);
            }


            partida.Descripcion = input.Descripcion;
            partida.NumeroPartida = input.NumeroPartida;
            partida.Valor = input.Valor;

            await Repository.UpdateAsync(jerarquia, autoSave: true);


            return await ObtenerPartidaArancelariaAsync(jerarquiaArancelariaId, partidaArancelariaId);
        }

        public async Task<PartidaArancelariaDto> AgregarPartidaArancelariaAsync(Guid jerarquiaArancelariaId, CrearActualizarPartidaArancelariaDto input)
        {
            await CheckUpdatePolicyAsync();

            var partida = await JerarquiaArancelariaManager.CrearPartidaArancelariaAsync(
                id: GuidGenerator.Create(),
                jerarquiaArancelariaId: jerarquiaArancelariaId,
                descripcion: input.Descripcion,
                numeroPartida: input.NumeroPartida,
                valor: input.Valor);

            var jerarquia = await JerarquiaArancelariaManager.AgregarPartidaArancelariaAsync(partida);

            await Repository.UpdateAsync(jerarquia, autoSave: true);

            return await ObtenerPartidaArancelariaAsync(jerarquiaArancelariaId, partida.Id);
        }

        public async Task<PartidaArancelariaDto> ObtenerPartidaArancelariaAsync(Guid jerarquiaArancelariaId, Guid partidaArancelariaId)
        {
            await CheckGetPolicyAsync();

            var queryable = await Repository.WithDetailsAsync(p => p.Partidas);
            queryable = queryable.Where(a => a.Id == jerarquiaArancelariaId);
            var queryablePartida = queryable.SelectMany(entity => entity.Partidas)
                    .Where(j => j.Id == partidaArancelariaId);

            var partidaDto = queryablePartida.Select(entity => new PartidaArancelariaDto()
            {
                Id = entity.Id,
                Descripcion = entity.Descripcion,
                NumeroPartida = entity.NumeroPartida,
                Valor = entity.Valor,
                JerarquiaArancelariaId = entity.JerarquiaArancelariaId
            });

            var resultado = await AsyncExecuter.SingleOrDefaultAsync(partidaDto);

            return resultado;
        }

        public async Task<PagedResultDto<PartidaArancelariaDto>> ObtenerPartidasArancelariasAsync(Guid jerarquiaArancelariaId, GetPartidaArancelariaInput input)
        {
            await CheckGetPolicyAsync();

            var queryable = await Repository.GetQueryableAsync();
            var queryablePartida = await PartidaRepository.GetQueryableAsync();

            queryable = queryable.Where(p => p.Id == jerarquiaArancelariaId);

            var queryableDto = from entity in queryable
                               join partida in queryablePartida on entity.Id equals partida.JerarquiaArancelariaId
                               select new PartidaArancelariaDto()
                               {
                                   Id = partida.Id,
                                   Descripcion = partida.Descripcion,
                                   NumeroPartida = partida.NumeroPartida,
                                   Valor = partida.Valor,
                                   JerarquiaArancelariaId = partida.JerarquiaArancelariaId
                               };

            var totalCount = await AsyncExecuter.CountAsync(queryableDto);

            var entityDtos = await AsyncExecuter.ToListAsync(queryableDto);

            return new PagedResultDto<PartidaArancelariaDto>(
                totalCount,
                entityDtos
            );
        }

        public async Task QuitarPartidaArancelariaAsync(Guid jerarquiaArancelariaId, Guid partidaArancelariaId)
        {
            await CheckUpdatePolicyAsync();

            var jerarquia = await JerarquiaArancelariaManager.QuitarPartidaArancelariaAsync(jerarquiaArancelariaId, partidaArancelariaId);

            await Repository.UpdateAsync(jerarquia, autoSave: true);

            await CurrentUnitOfWork.SaveChangesAsync();
        }


        #endregion Partida Arancelaria


    }

}
