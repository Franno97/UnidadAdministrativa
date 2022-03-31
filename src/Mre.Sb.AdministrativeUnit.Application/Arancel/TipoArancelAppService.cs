using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.AdministrativeUnit.Permissions;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
     
    public class TipoArancelAppService :
    CrudAppService<
        TipoArancel,
        TipoArancelDto,
        string>,
    ITipoArancelAppService
    {
        private readonly TipoArancelManager TariffTypeManager;

        public TipoArancelAppService(IRepository<TipoArancel, string> repository,
        TipoArancelManager tariffTypeManager)
            : base(repository)
        {
            this.TariffTypeManager = tariffTypeManager;

            //GetPolicyName = AdministrativeUnitPermissions.TariffType.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.TariffType.Default;

            //CreatePolicyName = AdministrativeUnitPermissions.TariffType.Create;
            //UpdatePolicyName = AdministrativeUnitPermissions.TariffType.Update;
            //DeletePolicyName = AdministrativeUnitPermissions.TariffType.Delete;
        }

        public override async Task<TipoArancelDto> CreateAsync(TipoArancelDto input)
        {
            await CheckCreatePolicyAsync();

            await TariffTypeManager.ValidateCreateAsync(input.Id);

            var entity = await MapToEntityAsync(input);

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await MapToGetOutputDtoAsync(entity);
        }

        public async Task<ListResultDto<TipoArancelLookupDto>> GetLookupAsync()
        {
            await CheckGetListPolicyAsync();

            var list = await Repository.GetListAsync();

            return new ListResultDto<TipoArancelLookupDto>(
                ObjectMapper.Map<List<TipoArancel>, List<TipoArancelLookupDto>>(list)
            );
        }

    }

}
