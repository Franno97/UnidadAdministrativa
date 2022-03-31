using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.AdministrativeUnit.Permissions;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{


    public class MonedaAppService :
    CrudAppService<
        Moneda,
        MonedaDto,
        string>,
    IMonedaAppService
    {
        private readonly MonedaManager CurrencyManager;

        public MonedaAppService(IRepository<Moneda, string> repository,
        MonedaManager currencyManager)
            : base(repository)
        {
            this.CurrencyManager = currencyManager;

            //GetPolicyName = AdministrativeUnitPermissions.Moneda.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.Moneda.Default;
            CreatePolicyName = AdministrativeUnitPermissions.Currency.Create;
            UpdatePolicyName = AdministrativeUnitPermissions.Currency.Update;
            DeletePolicyName = AdministrativeUnitPermissions.Currency.Delete;
        }

        public override async Task<MonedaDto> CreateAsync(MonedaDto input)
        {
            await CheckCreatePolicyAsync();

            await CurrencyManager.ValidateCreateAsync(input.Id);

            var entity = await MapToEntityAsync(input);

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await MapToGetOutputDtoAsync(entity);
        }

        public async Task<ListResultDto<MonedaLookupDto>> GetLookupAsync()
        {
            await CheckGetListPolicyAsync();

            var list = await Repository.GetListAsync();

            return new ListResultDto<MonedaLookupDto>(
                ObjectMapper.Map<List<Moneda>, List<MonedaLookupDto>>(list)
            );
        }

    }


}
