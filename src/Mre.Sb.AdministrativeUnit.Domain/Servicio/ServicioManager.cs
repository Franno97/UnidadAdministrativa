using System;
using System.Threading.Tasks;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Domain.Services;
using System.Linq;
using Volo.Abp;
using Microsoft.Extensions.Localization;
using Mre.Sb.AdministrativeUnit.Localization;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    public class ServicioManager : DomainService
    {
        private readonly IRepository<Servicio, Guid> repository;
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;

        public ServicioManager(IRepository<Servicio,Guid> repository,
            IStringLocalizer<AdministrativeUnitResource> localizer)
        {
            this.repository = repository;
            this.localizer = localizer;
        }

        public virtual async Task<Servicio> CreateAsync(Guid id, string name, 
                string serviceTypeId, bool isPresentialAttention, bool isSemipresentialAttention, bool isVirtualAttention, bool isActive=true) {

            
            var queryable = await repository.GetQueryableAsync();
            var existing = queryable.Any(e => e.Nombre.ToUpper() == name.ToUpper());

            if (existing) { 
                throw new UserFriendlyException(string.Format(localizer["Service:NameExist"], name));
            }

            var entity = new Servicio(id,name, serviceTypeId: serviceTypeId,
                isPresentialAttention: isPresentialAttention, isSemipresentialAttention: isSemipresentialAttention, isVirtualAttention: isVirtualAttention, isActive: isActive);

            return entity;
        }

        public async Task ChangeNameAsync(
               Servicio service,
               string newName)
        {
            Check.NotNull(service, nameof(service));
            Check.NotNullOrWhiteSpace(newName, nameof(newName));

            var queryable = await repository.GetQueryableAsync();
            var existing = queryable.Any(e => e.Nombre.ToUpper() == newName.ToUpper() &&
                    e.Id == service.Id);
             
            if (existing)
            {
               throw new AbpException(string.Format(localizer["Service:NameExist"], newName));
            }

            service.ChangeName(newName);
        }


        public async Task ChangeIsActiveAsync(
               Servicio service,
               bool isActive)
        {
            Check.NotNull(service, nameof(service));
            Check.NotNull(isActive, nameof(isActive));

           

            service.ChangeIsActive(isActive);
        }
    }

}
