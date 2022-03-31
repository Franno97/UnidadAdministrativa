using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.AdministrativeUnit.Permissions;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{

    public class UnidadAdministrativaTipoAppService :
    CrudAppService<
        TipoUnidadAdministrativa,
        UnidadAdministrativaTipoDto,
        string>,
    IUnidadAdministrativaTipoAppService
    {
        private readonly TipoUnidadAdministrativaManager administrativeUnitTpeManager; 

        public UnidadAdministrativaTipoAppService(IRepository<TipoUnidadAdministrativa, string> repository,
        TipoUnidadAdministrativaManager administrativeUnitTpeManager)
            : base(repository)
        {
            this.administrativeUnitTpeManager = administrativeUnitTpeManager; 

            //GetPolicyName = AdministrativeUnitPermissions.TipoUnidadAdministrativa.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.TipoUnidadAdministrativa.Default;
            CreatePolicyName = AdministrativeUnitPermissions.AdministrativeUnitType.Create;
            UpdatePolicyName = AdministrativeUnitPermissions.AdministrativeUnitType.Update;
            DeletePolicyName = AdministrativeUnitPermissions.AdministrativeUnitType.Delete;
        }

        public override async Task<UnidadAdministrativaTipoDto> CreateAsync(UnidadAdministrativaTipoDto input)
        {
            await CheckCreatePolicyAsync();

            

            await administrativeUnitTpeManager.ValidateCreateAsync(input.Id);

            var entity = await MapToEntityAsync(input);

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await MapToGetOutputDtoAsync(entity);
        }

        public async Task<ListResultDto<UnidadAdministrativaTipoInfoDto>> ObtenerListaInfoAsync()
        {
            await CheckGetListPolicyAsync();

            var list = await Repository.GetListAsync();

            return new ListResultDto<UnidadAdministrativaTipoInfoDto>(
                ObjectMapper.Map<List<TipoUnidadAdministrativa>, List<UnidadAdministrativaTipoInfoDto>>(list)
            );
        }

    }

}
