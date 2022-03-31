using Microsoft.Extensions.Localization;
using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.AdministrativeUnit.Localization;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Domain.Services;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    public class TipoUnidadAdministrativaManager : DomainService
    {
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;

        private readonly IRepository<TipoUnidadAdministrativa, string> repository;


        public TipoUnidadAdministrativaManager(IRepository<TipoUnidadAdministrativa, string> repository,
            IStringLocalizer<AdministrativeUnitResource> localizer)
        {
            this.repository = repository;
            this.localizer = localizer;

        }
         
        public async virtual Task ValidateCreateAsync(string input) {

            var exist = await repository.AnyAsync(e => e.Id.ToUpper() == input.ToUpper());
            if (exist)
            {
                var msg = string.Format(localizer["AdministrativeUnitType:Exist"], input);
                throw new UserFriendlyException(msg);
            }
        }
    }



    



}
