using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.AdministrativeUnit.Permissions;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class CargoAppService :
    CrudAppService<
        Cargo,
        CargoDto,
        string>,
    ICargoAppService
    {
        private readonly CargoManager PositionManager;

        public CargoAppService(IRepository<Cargo, string> repository,
        CargoManager positionManager)
            : base(repository)
        {
            this.PositionManager = positionManager;

            //GetPolicyName = AdministrativeUnitPermissions.Cargo.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.Cargo.Default;
            //CreatePolicyName = AdministrativeUnitPermissions.Cargo.Create;
            //UpdatePolicyName = AdministrativeUnitPermissions.Cargo.Update;
            DeletePolicyName = AdministrativeUnitPermissions.Position.Delete;
        }

        public override async Task<CargoDto> CreateAsync(CargoDto input)
        {
            await CheckCreatePolicyAsync();

            await PositionManager.ValidateCreateAsync(input.Id);

            var entity = await MapToEntityAsync(input);

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await MapToGetOutputDtoAsync(entity);
        }

        public async Task<ListResultDto<CargoLookupDto>> GetLookupAsync()
        {
            await CheckGetListPolicyAsync();

            var list = await Repository.GetListAsync();

            return new ListResultDto<CargoLookupDto>(
                ObjectMapper.Map<List<Cargo>, List<CargoLookupDto>>(list)
            );
        }

    }

}
