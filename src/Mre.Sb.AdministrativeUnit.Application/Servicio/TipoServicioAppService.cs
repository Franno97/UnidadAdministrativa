using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.AdministrativeUnit.Permissions;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{


    public class TipoServicioAppService :
    CrudAppService<
        TipoServicio,
        TipoServicioDto,
        string>,
    ITipoServicioAppService
    {
        private readonly TipoServicioManager serviceTypeManager;

        public TipoServicioAppService(IRepository<TipoServicio, string> repository,
        TipoServicioManager serviceTypeManager)
            : base(repository)
        {
            this.serviceTypeManager = serviceTypeManager;

            //GetPolicyName = AdministrativeUnitPermissions.TipoServicio.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.TipoServicio.Default;
            CreatePolicyName = AdministrativeUnitPermissions.ServiceType.Create;
            UpdatePolicyName = AdministrativeUnitPermissions.ServiceType.Update;
            DeletePolicyName = AdministrativeUnitPermissions.ServiceType.Delete;
        }

        public override async Task<TipoServicioDto> CreateAsync(TipoServicioDto input)
        {
            await CheckCreatePolicyAsync();

            await serviceTypeManager.ValidateCreateAsync(input.Id);

            var entity = await MapToEntityAsync(input);

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await MapToGetOutputDtoAsync(entity);
        }

        public async Task<ListResultDto<TipoServicioLookupDto>> GetLookupAsync()
        {
            await CheckGetListPolicyAsync();

            var list = await Repository.GetListAsync();

            return new ListResultDto<TipoServicioLookupDto>(
                ObjectMapper.Map<List<TipoServicio>, List<TipoServicioLookupDto>>(list)
            );
        }

    }


}
