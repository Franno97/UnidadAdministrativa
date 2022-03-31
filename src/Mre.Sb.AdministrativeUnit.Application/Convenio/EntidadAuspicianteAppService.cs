using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.AdministrativeUnit.Permissions;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
     
    public class EntidadAuspicianteAppService :
    CrudAppService<
        EntidadAuspiciante,
        EntidadAuspicianteDto,
        string>,
    IEntidadAuspicianteAppService
    {
        private readonly EntidadAuspicianteManager EntidadAuspicianteManager;

        public EntidadAuspicianteAppService(IRepository<EntidadAuspiciante, string> repository,
        EntidadAuspicianteManager entidadAuspicianteManager)
            : base(repository)
        {
            this.EntidadAuspicianteManager = entidadAuspicianteManager;

            //GetPolicyName = AdministrativeUnitPermissions.TariffType.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.TariffType.Default;

            //CreatePolicyName = AdministrativeUnitPermissions.TariffType.Create;
            //UpdatePolicyName = AdministrativeUnitPermissions.TariffType.Update;
            //DeletePolicyName = AdministrativeUnitPermissions.TariffType.Delete;
        }

        public override async Task<EntidadAuspicianteDto> CreateAsync(EntidadAuspicianteDto input)
        {
            await CheckCreatePolicyAsync();

            await EntidadAuspicianteManager.ValidateCreateAsync(input.Id);

            var entity = await MapToEntityAsync(input);

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await MapToGetOutputDtoAsync(entity);
        }

        public async Task<ListResultDto<EntidadAuspicianteLookupDto>> GetLookupAsync()
        {
            await CheckGetListPolicyAsync();

            var list = await Repository.GetListAsync();

            return new ListResultDto<EntidadAuspicianteLookupDto>(
                ObjectMapper.Map<List<EntidadAuspiciante>, List<EntidadAuspicianteLookupDto>>(list)
            );
        }

    }

}
