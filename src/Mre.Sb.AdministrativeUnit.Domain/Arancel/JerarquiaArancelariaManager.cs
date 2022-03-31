using Microsoft.Extensions.Localization;
using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.AdministrativeUnit.Localization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Domain.Entities;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Domain.Services;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{

    public class JerarquiaArancelariaManager : DomainService
    {
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;

        private readonly IRepository<JerarquiaArancelaria, Guid> repository;
        private readonly IRepository<PartidaArancelaria> partidaArancelariaRepository;

        public JerarquiaArancelariaManager(IRepository<JerarquiaArancelaria, Guid> repository,
            IRepository<PartidaArancelaria> partidaArancelariaRepository,
            IStringLocalizer<AdministrativeUnitResource> localizer)
        {
            this.repository = repository;
            this.partidaArancelariaRepository = partidaArancelariaRepository;
            this.localizer = localizer;

        }

        public virtual async Task<JerarquiaArancelaria> CreateAsync(Guid id, Guid tariffId, string tariffTypeId, string description, int order, int hierarchyNumber)
        {
            //1. Check if exist
            var queryable = await repository.GetQueryableAsync();
            var existingDescription = queryable.Any(a => a.Descripcion.ToUpper() == description.ToUpper());

            if (existingDescription)
            {
                //TODO: #issues/23
                throw new AbpException(string.Format(localizer["Service:DescriptionExist"], description));
            }

            var entity = new JerarquiaArancelaria(id: id, arancelId: tariffId, tipoArancelId: tariffTypeId, descripcion: description, orden: order, numeroJerarquia: hierarchyNumber);

            return entity;
        }

        public async Task ChangeDescriptionAsync(
               JerarquiaArancelaria tariffHierarchy,
               string newDescription)
        {
            Check.NotNull(tariffHierarchy, nameof(tariffHierarchy));
            Check.NotNullOrWhiteSpace(newDescription, nameof(newDescription));

            var queryable = await repository.GetQueryableAsync();
            var existingDescription = queryable.Any(a => a.Descripcion.ToUpper() == newDescription);

            if (existingDescription)
            {
                //TODO: #issues/23
                throw new AbpException(string.Format(localizer["Service:DescriptionExist"], newDescription));
            }

            tariffHierarchy.CambiarDescripcion(newDescription);
        }


        #region Partida Arancelaria

        public async Task<PartidaArancelaria> CrearPartidaArancelariaAsync(Guid id, Guid jerarquiaArancelariaId, string descripcion, string numeroPartida, decimal valor)
        {
            Check.NotNull(id, nameof(id));
            Check.NotNull(jerarquiaArancelariaId, nameof(jerarquiaArancelariaId));


            var entity = new PartidaArancelaria(id: id, jerarquiaArancelariaId: jerarquiaArancelariaId, descripcion: descripcion, numeroPartida: numeroPartida, valor: valor);

            return entity;

        }


        public async Task<JerarquiaArancelaria> AgregarPartidaArancelariaAsync(PartidaArancelaria partidaArancelaria)
        {

            var queryable = await repository.GetQueryableAsync();
            var query = queryable.Where(a => a.Id == partidaArancelaria.JerarquiaArancelariaId);

            var jerarquia = await AsyncExecuter.FirstOrDefaultAsync(query);
            if (jerarquia == null)
            {
                throw new EntityNotFoundException(typeof(Mre.Sb.UnidadAdministrativa.Dominio.JerarquiaArancelaria), partidaArancelaria.JerarquiaArancelariaId);
            }

            jerarquia.AgregarPartida(partidaArancelaria.Id, partidaArancelaria.Descripcion, partidaArancelaria.NumeroPartida, partidaArancelaria.Valor);

            return jerarquia;

        }

        public async Task<JerarquiaArancelaria> QuitarPartidaArancelariaAsync(Guid jerarquiaArancelariaId, Guid partidaArancelariaId)
        {
            Check.NotNull(jerarquiaArancelariaId, nameof(jerarquiaArancelariaId));
            Check.NotNull(partidaArancelariaId, nameof(partidaArancelariaId));

            var queryablePartidas = await partidaArancelariaRepository.GetQueryableAsync();

            queryablePartidas = queryablePartidas.Where(s => s.JerarquiaArancelariaId == jerarquiaArancelariaId && s.Id == partidaArancelariaId);

            var partida = await AsyncExecuter.FirstOrDefaultAsync(queryablePartidas);

            if (partida == null)
            {
                throw new EntityNotFoundException(typeof(PartidaArancelaria), partidaArancelariaId);
            }

            var queryable = await repository.GetQueryableAsync();
            var query = queryable.Where(a => a.Id == jerarquiaArancelariaId);

            var jerarquia = await AsyncExecuter.FirstOrDefaultAsync(query);

            jerarquia.QuitarPartida(partidaArancelariaId);

            return jerarquia;
        }

        #endregion Partida Arancelaria
    }


}
