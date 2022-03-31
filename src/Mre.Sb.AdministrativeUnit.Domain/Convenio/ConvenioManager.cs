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

    public class ConvenioManager : DomainService
    {
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;

        private readonly IRepository<Convenio, Guid> repository;
        private readonly IRepository<Exoneracion> exonerationRepository;

        public ConvenioManager(IRepository<Convenio, Guid> repository,
            IRepository<Exoneracion> exonerationRepository,
            IStringLocalizer<AdministrativeUnitResource> localizer)
        {
            this.repository = repository;
            this.exonerationRepository = exonerationRepository;
            this.localizer = localizer;

        }

        public virtual async Task<Convenio> CreateAsync(Guid id, string description, DateTime creationDate, DateTime? expirationDate)
        {
            //1. Check if exist
            var queryable = await repository.GetQueryableAsync();
            var existingDescription = queryable.Any(a => a.Descripcion.ToUpper() == description.ToUpper());

            if (existingDescription)
            {

                throw new UserFriendlyException(string.Format(localizer["Service:DescriptionExist"], description));
            }

            var entity = new Convenio(id: id, description: description, creationDate: creationDate, expirationDate: expirationDate);

            return entity;
        }

        public async Task ChangeDescriptionAsync(
               Convenio Agreement,
               string newDescription)
        {
            Check.NotNull(Agreement, nameof(Agreement));
            Check.NotNullOrWhiteSpace(newDescription, nameof(newDescription));

            var queryable = await repository.GetQueryableAsync();
            var existingDescription = queryable.Any(a => a.Descripcion.ToUpper() == newDescription);

            if (existingDescription)
            {
                //TODO: #issues/23
                throw new AbpException(string.Format(localizer["Service:DescriptionExist"], newDescription));
            }

            Agreement.ChangeDescription(newDescription);
        }

        public async Task<Convenio> AddExonerationAsync(Guid id,
            Guid serviceId,
            decimal value,
            string tipoExoneracionId,
            string entidadAuspicianteId,
            string paisId,
            int? edadInicial,
            int? edadFinal,
            bool? discapacitado)
        {
            Check.NotNull(id, nameof(id));
            Check.NotNull(serviceId, nameof(serviceId));

            var queryable = await repository.WithDetailsAsync(a => a.Exoneraciones);
            var query = queryable.Where(au => au.Id == id);

            var agreement = await AsyncExecuter.FirstOrDefaultAsync(query);
            if (agreement == null)
            {
                throw new EntityNotFoundException(typeof(Convenio), id);
            }

            //Check
            var exist = await ExistExonerationAsync(id, serviceId);
            if (exist)
            {
                throw new UserFriendlyException(string.Format(localizer["AdministrativeUnit:ServiceExist"]));
            }

            agreement.AddExoneration(
                serviceId,
                value,
                tipoExoneracionId,
                entidadAuspicianteId,
                paisId,
                edadInicial,
                edadFinal,
                discapacitado);

            return agreement;
        }

        public async Task<Convenio> RemoveExonerationAsync(Guid id, Guid serviceId)
        {
            Check.NotNull(id, nameof(id));
            Check.NotNull(serviceId, nameof(serviceId));

            var queryableServices = await exonerationRepository.GetQueryableAsync();

            queryableServices = queryableServices.Where(s => s.ConvenioId == id && s.ServicioId == serviceId);

            var exoneration = await AsyncExecuter.FirstOrDefaultAsync(queryableServices);

            if (exoneration == null)
            {
                throw new EntityNotFoundException(typeof(Exoneracion), id);
            }

            var queryable = await repository.GetQueryableAsync();
            var query = queryable.Where(ua => ua.Id == id);

            var agreement = await AsyncExecuter.FirstOrDefaultAsync(query);

            agreement.RemoveExoneration(serviceId);

            return agreement;
        }

        public virtual async Task<bool> ExistExonerationAsync(Guid agreementId, Guid serviceId)
        {
            Check.NotNull(agreementId, nameof(agreementId));
            Check.NotNull(serviceId, nameof(serviceId));

            var queryable = await exonerationRepository.GetQueryableAsync();
            queryable = queryable.Where(p => p.ConvenioId == agreementId);
            queryable = queryable.Where(p => p.ServicioId == serviceId);

            return queryable.Any();
        }
    }


}
