using Mre.Sb.AdministrativeUnit.Permissions;
using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{

    public class TipoCuentaBancariaAppService :
    CrudAppService<
        TipoCuentaBancaria,
        TipoCuentaBancariaDto,
        string>,
    ITipoCuentaBancariaAppService
    {
        private readonly TipoCuentaBancariaManager TipoCuentaBancariaManager;

        public TipoCuentaBancariaAppService(IRepository<TipoCuentaBancaria, string> repository,
        TipoCuentaBancariaManager tipoCuentaBancariaManager)
            : base(repository)
        {
            this.TipoCuentaBancariaManager = tipoCuentaBancariaManager;

            //GetPolicyName = AdministrativeUnitPermissions.TipoCuentaBancaria.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.TipoCuentaBancaria.Default;
            CreatePolicyName = AdministrativeUnitPermissions.TipoCuentaBancaria.Create;
            UpdatePolicyName = AdministrativeUnitPermissions.TipoCuentaBancaria.Update;
            DeletePolicyName = AdministrativeUnitPermissions.TipoCuentaBancaria.Delete;
        }

        public override async Task<TipoCuentaBancariaDto> CreateAsync(TipoCuentaBancariaDto input)
        {
            await CheckCreatePolicyAsync();

            await TipoCuentaBancariaManager.ValidateCreateAsync(input.Id);

            var entity = await MapToEntityAsync(input);

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await MapToGetOutputDtoAsync(entity);
        }

        public async Task<ListResultDto<TipoCuentaBancariaDto>> GetLookupAsync()
        {
            await CheckGetListPolicyAsync();

            var list = await Repository.GetListAsync();

            return new ListResultDto<TipoCuentaBancariaDto>(
                ObjectMapper.Map<List<TipoCuentaBancaria>, List<TipoCuentaBancariaDto>>(list)
            );
        }

    }

}
