using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.AdministrativeUnit.Permissions;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
     
    public class TipoExoneracionAppService :
    CrudAppService<
        TipoExoneracion,
        TipoExoneracionDto,
        string>,
    ITipoExoneracionAppService
    {
        private readonly TipoExoneracionManager TipoExoneracionManager;

        public TipoExoneracionAppService(IRepository<TipoExoneracion, string> repository,
        TipoExoneracionManager tipoExoneracionManager)
            : base(repository)
        {
            this.TipoExoneracionManager = tipoExoneracionManager;

            //GetPolicyName = AdministrativeUnitPermissions.TariffType.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.TariffType.Default;

            //CreatePolicyName = AdministrativeUnitPermissions.TariffType.Create;
            //UpdatePolicyName = AdministrativeUnitPermissions.TariffType.Update;
            //DeletePolicyName = AdministrativeUnitPermissions.TariffType.Delete;
        }

        public override async Task<TipoExoneracionDto> CreateAsync(TipoExoneracionDto input)
        {
            await CheckCreatePolicyAsync();

            await TipoExoneracionManager.ValidateCreateAsync(input.Id);

            var entity = await MapToEntityAsync(input);

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await MapToGetOutputDtoAsync(entity);
        }

        public async Task<ListResultDto<TipoExoneracionLookupDto>> GetLookupAsync()
        {
            await CheckGetListPolicyAsync();

            var list = await Repository.GetListAsync();

            return new ListResultDto<TipoExoneracionLookupDto>(
                ObjectMapper.Map<List<TipoExoneracion>, List<TipoExoneracionLookupDto>>(list)
            );
        }

    }

}
