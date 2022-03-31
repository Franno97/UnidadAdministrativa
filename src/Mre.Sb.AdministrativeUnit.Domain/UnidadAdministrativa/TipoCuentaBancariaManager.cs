using Microsoft.Extensions.Localization;
using Mre.Sb.AdministrativeUnit.Localization;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Domain.Services;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{

    public class TipoCuentaBancariaManager : DomainService
    {
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;

        private readonly IRepository<TipoCuentaBancaria, string> repository;


        public TipoCuentaBancariaManager(IRepository<TipoCuentaBancaria, string> repository,
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
                var msg = string.Format(localizer["TipoCuentaBancaria:Exist"], input);
                throw new UserFriendlyException(msg);
            }
        }
    }


}
