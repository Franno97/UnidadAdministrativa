using Microsoft.Extensions.Localization;
using Mre.Sb.UnidadAdministrativa.Dominio;
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

    public class TipoServicioManager : DomainService
    {
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;

        private readonly IRepository<TipoServicio, string> repository;


        public TipoServicioManager(IRepository<TipoServicio, string> repository,
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
                var msg = string.Format(localizer["ServiceType:Exist"], input);
                throw new UserFriendlyException(msg);
            }
        }
    }


}
