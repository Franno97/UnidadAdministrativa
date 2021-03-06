using Microsoft.Extensions.Localization;
using Mre.Sb.AdministrativeUnit.Localization;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Domain.Services;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    public class BancoManager : DomainService
    {
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;

        private readonly IRepository<Banco, string> repository;


        public BancoManager(IRepository<Banco, string> repository,
            IStringLocalizer<AdministrativeUnitResource> localizer)
        {
            this.repository = repository;
            this.localizer = localizer;

        }

        public async Task ValidateCreateAsync(string input)
        {

            var exist = await repository.AnyAsync(e => e.Id.ToUpper() == input.ToUpper());
            if (exist)
            {
                var msg = string.Format(localizer["Bank:Exist"], input);
                throw new UserFriendlyException(msg);
            }
        }
    }



}
