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

    public class ArancelManager : DomainService
    {
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;

        private readonly IRepository<Arancel, Guid> repository;
        private readonly IRepository<JerarquiaArancelaria> jerarquiaArancelariaRepository;

        public ArancelManager(IRepository<Arancel, Guid> repository,
            IRepository<JerarquiaArancelaria> jerarquiaArancelariaRepository,
            IStringLocalizer<AdministrativeUnitResource> localizer)
        {
            this.repository = repository;
            this.jerarquiaArancelariaRepository = jerarquiaArancelariaRepository;
            this.localizer = localizer;

        }

        public virtual async Task<Arancel> CreateAsync(Guid id, string description, string currencyId, bool isActive = true)
        {
            //1. Check if exist
            var queryable = await repository.GetQueryableAsync();
            var existingDescription = queryable.Any(a => a.Descripcion.ToUpper() == description.ToUpper());

            if (existingDescription)
            {
                //TODO: #issues/23
                throw new AbpException(string.Format(localizer["Service:DescriptionExist"], description));
            }

            var entity = new Arancel(id: id, descripcion: description, monedaId: currencyId, activo: isActive);

            return entity;
        }

        public async Task ChangeDescriptionAsync(
               Arancel tariff,
               string newDescription)
        {
            Check.NotNull(tariff, nameof(tariff));
            Check.NotNullOrWhiteSpace(newDescription, nameof(newDescription));

            var queryable = await repository.GetQueryableAsync();
            var existingDescription = queryable.Any(a => a.Descripcion.ToUpper() == newDescription);

            if (existingDescription)
            {
                //TODO: #issues/23
                throw new AbpException(string.Format(localizer["Service:DescriptionExist"], newDescription));
            }

            tariff.CambiarDescripcion(newDescription);
        }

        public async Task<Arancel> ChangeStateAsync(Guid id, bool isActive)
        {
            Check.NotNull(id, nameof(id));

            var tariff = await repository.GetAsync(id);

            tariff.CambiarEstadoActivo(isActive);

            return tariff;
        }



        #region Jerarquia Arancelaria

        public async Task<JerarquiaArancelaria> CrearJerarquiaArancelariaAsync(Guid id, Guid arancelId, string tipoArancelId, string descripcion, int orden, int numeroJerarquia)
        {
            Check.NotNull(id, nameof(id));
            Check.NotNull(arancelId, nameof(arancelId));


            var entity = new JerarquiaArancelaria(id: id, arancelId: arancelId, tipoArancelId: tipoArancelId, descripcion: descripcion, orden: orden, numeroJerarquia: numeroJerarquia);

            return entity;

        }


        public async Task<Arancel> AgregarJerarquiaArancelariaAsync(JerarquiaArancelaria jerarquiaArancelaria)
        {

            var queryable = await repository.GetQueryableAsync();
            var query = queryable.Where(a => a.Id == jerarquiaArancelaria.ArancelId);

            var arancel = await AsyncExecuter.FirstOrDefaultAsync(query);
            if (arancel == null)
            {
                throw new EntityNotFoundException(typeof(Mre.Sb.UnidadAdministrativa.Dominio.Arancel), jerarquiaArancelaria.ArancelId);
            }


            //Check
            //var exist = await ExistServiceAsync(id, serviceId);
            //if (exist)
            //{
            //    throw new UserFriendlyException(string.Format(localizer["UnidadAdministrativa:ServiceExist"]));
            //}

            arancel.AgregarJerarquia(jerarquiaArancelaria.Id, jerarquiaArancelaria.TipoArancelId, jerarquiaArancelaria.Descripcion, jerarquiaArancelaria.Orden, jerarquiaArancelaria.NumeroJerarquia);

            return arancel;

        }

        public async Task<Arancel> QuitarJerarquiaArancelariaAsync(Guid arancelId, Guid jerarquiaId)
        {
            Check.NotNull(arancelId, nameof(arancelId));
            Check.NotNull(jerarquiaId, nameof(jerarquiaId));

            var queryableJerarquias = await jerarquiaArancelariaRepository.GetQueryableAsync();

            queryableJerarquias = queryableJerarquias.Where(s => s.ArancelId == arancelId && s.Id == jerarquiaId);

            var jerarquia = await AsyncExecuter.FirstOrDefaultAsync(queryableJerarquias);

            if (jerarquia == null)
            {
                throw new EntityNotFoundException(typeof(JerarquiaArancelaria), jerarquiaId);
            }

            var queryable = await repository.GetQueryableAsync();
            var query = queryable.Where(a => a.Id == arancelId);

            var arancel = await AsyncExecuter.FirstOrDefaultAsync(query);

            arancel.QuitarJerarquia(jerarquiaId);

            return arancel;
        }

        #endregion Jerarquia Arancelaria
    }


}
