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

    public class PartidaArancelariaManager : DomainService
    {
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;

        private readonly IRepository<PartidaArancelaria, Guid> repository;
        private readonly IRepository<PartidaArancelariaServicio> tariffHeadingServiceRespository;


        public PartidaArancelariaManager(IRepository<PartidaArancelaria, Guid> repository,
            IStringLocalizer<AdministrativeUnitResource> localizer,
            IRepository<PartidaArancelariaServicio> tariffHeadingServiceRespository)
        {
            this.repository = repository;
            this.tariffHeadingServiceRespository = tariffHeadingServiceRespository;
            this.localizer = localizer;

        }

        public virtual async Task<PartidaArancelaria> CreateAsync(Guid id, string description, string headingNumber, decimal value, Guid tariffHierarchyId)
        {
            //1. Check if exist
            var queryable = await repository.GetQueryableAsync();
            var existingDescription = queryable.Any(a => a.Descripcion.ToUpper() == description.ToUpper());

            if (existingDescription)
            {
                throw new UserFriendlyException(string.Format(localizer["TariffHeading:DescriptionExist"], description));
            }

            var entity = new PartidaArancelaria(id: id, jerarquiaArancelariaId: tariffHierarchyId, descripcion: description, numeroPartida: headingNumber, valor: value);

            return entity;
        }

        public async Task ChangeDescriptionAsync(
               PartidaArancelaria TariffHeading,
               string newDescription)
        {
            Check.NotNull(TariffHeading, nameof(TariffHeading));
            Check.NotNullOrWhiteSpace(newDescription, nameof(newDescription));

            var queryable = await repository.GetQueryableAsync();
            var existingDescription = queryable.Any(a => a.Descripcion.ToUpper() == newDescription);

            if (existingDescription)
            {
                throw new UserFriendlyException(string.Format(localizer["TariffHeading:DescriptionExist"], newDescription));
            }

            TariffHeading.ChangeDescription(newDescription);
        }
        #region Services
        public async Task<PartidaArancelaria> AddServiceAsync(Guid tariffHeadingId, Guid serviceId)
        {
            Check.NotNull(tariffHeadingId, nameof(tariffHeadingId));
            Check.NotNull(serviceId, nameof(serviceId));

            var queryable = await repository.WithDetailsAsync(t => t.Servicios);

            var query = queryable.Where(t => t.Id == tariffHeadingId);

            var tariffHeading = await AsyncExecuter.FirstOrDefaultAsync(query);
            if (tariffHeading == null)
            {
                throw new EntityNotFoundException(typeof(PartidaArancelaria), tariffHeadingId);
            }

            var exist = await ExistServiceAsync(serviceId);
            if (exist)
            {
                throw new UserFriendlyException(string.Format(localizer["TariffHeading:ServiceExist"]));
            }

            tariffHeading.AddService(serviceId);

            return tariffHeading;
        }

        private async Task<bool> ExistServiceAsync(Guid serviceId)
        {
            Check.NotNull(serviceId, nameof(serviceId));

            var queryable = await tariffHeadingServiceRespository.GetQueryableAsync();
            queryable = queryable.Where(p => p.ServicioId == serviceId);

            return queryable.Any();
        }

        public async Task<PartidaArancelaria> RemoveServiceAsync(Guid tariffHeadingId, Guid serviceId)
        {
            Check.NotNull(tariffHeadingId, nameof(tariffHeadingId));
            Check.NotNull(serviceId, nameof(serviceId));

            var queryableTariffHeadingService = await tariffHeadingServiceRespository.GetQueryableAsync();

            queryableTariffHeadingService = queryableTariffHeadingService.Where(ts => ts.PartidaArancelariaId == tariffHeadingId);
            queryableTariffHeadingService = queryableTariffHeadingService.Where(ts => ts.ServicioId == serviceId);

            var tariffHeadingService = await AsyncExecuter.FirstOrDefaultAsync(queryableTariffHeadingService);

            if (tariffHeadingService == null)
            {
                throw new EntityNotFoundException(typeof(PartidaArancelariaServicio), $"{tariffHeadingId} - {serviceId}");
            }

            var queryable = await repository.GetQueryableAsync();
            var query = queryable.Where(th => th.Id == tariffHeadingId);

            var tariffHeading = await AsyncExecuter.FirstOrDefaultAsync(query);

            tariffHeading.RemoveService(serviceId);

            return tariffHeading;
        }
        #endregion
    }


}
