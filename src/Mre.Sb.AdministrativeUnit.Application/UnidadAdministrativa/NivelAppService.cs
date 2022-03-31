using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.AdministrativeUnit.Permissions;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
     
    public class NivelAppService :
    CrudAppService<
        Nivel,
        NivelDto,
        string>,
    INivelAppService
    {
        private readonly NivelManager LevelManager;

        public NivelAppService(IRepository<Nivel, string> repository,
        NivelManager levelManager)
            : base(repository)
        {
            this.LevelManager = levelManager;

            //GetPolicyName = AdministrativeUnitPermissions.Nivel.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.Nivel.Default;
            CreatePolicyName = AdministrativeUnitPermissions.Level.Create;
            UpdatePolicyName = AdministrativeUnitPermissions.Level.Update;
            DeletePolicyName = AdministrativeUnitPermissions.Level.Delete;
        }

        public override async Task<NivelDto> CreateAsync(NivelDto input)
        {
            await CheckCreatePolicyAsync();

            await LevelManager.ValidateCreateAsync(input.Id);

            var entity = await MapToEntityAsync(input);

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await MapToGetOutputDtoAsync(entity);
        }

        public async Task<ListResultDto<NivelLookupDto>> GetLookupAsync()
        {
            await CheckGetListPolicyAsync();

            var list = await Repository.GetListAsync();

            return new ListResultDto<NivelLookupDto>(
                ObjectMapper.Map<List<Nivel>, List<NivelLookupDto>>(list)
            );
        }

    }


}
