using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.AdministrativeUnit.Permissions;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{


    public class BancoAppService :
    CrudAppService<
        Banco,
        BancoDto,
        string>,
    IBancoAppService
    {
        private readonly BancoManager BankManager;

        public BancoAppService(IRepository<Banco, string> repository,
        BancoManager bankManager)
            : base(repository)
        {
            this.BankManager = bankManager;

            //GetPolicyName = AdministrativeUnitPermissions.Banco.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.Banco.Default;
            CreatePolicyName = AdministrativeUnitPermissions.Bank.Create;
            UpdatePolicyName = AdministrativeUnitPermissions.Bank.Update;
            DeletePolicyName = AdministrativeUnitPermissions.Bank.Delete;
        }

        public override async Task<BancoDto> CreateAsync(BancoDto input)
        {
            await CheckCreatePolicyAsync();

            await BankManager.ValidateCreateAsync(input.Id);

            var entity = await MapToEntityAsync(input);

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await MapToGetOutputDtoAsync(entity);
        }

        public async Task<ListResultDto<BancoLookupDto>> GetLookupAsync()
        {
            await CheckGetListPolicyAsync();

            var list = await Repository.GetListAsync();

            return new ListResultDto<BancoLookupDto>(
                ObjectMapper.Map<List<Banco>, List<BancoLookupDto>>(list)
            );
        }

    }


}
