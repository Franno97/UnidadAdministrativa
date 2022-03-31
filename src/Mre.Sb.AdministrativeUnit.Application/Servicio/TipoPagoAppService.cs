using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.AdministrativeUnit.Permissions;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
     
    public class TipoPagoAppService :
    CrudAppService<
        TipoPago,
        TipoPagoDto,
        string>,
    ITipoPagoAppService
    {
        private readonly TipoPagoManager PaymentTypeManager;

        public TipoPagoAppService(IRepository<TipoPago, string> repository,
        TipoPagoManager paymentTypeManager)
            : base(repository)
        {
            this.PaymentTypeManager = paymentTypeManager;

            //GetPolicyName = AdministrativeUnitPermissions.TipoPago.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.TipoPago.Default;
            CreatePolicyName = AdministrativeUnitPermissions.PaymentType.Create;
            UpdatePolicyName = AdministrativeUnitPermissions.PaymentType.Update;
            DeletePolicyName = AdministrativeUnitPermissions.PaymentType.Delete;
        }

        public override async Task<TipoPagoDto> CreateAsync(TipoPagoDto input)
        {
            await CheckCreatePolicyAsync();

            await PaymentTypeManager.ValidateCreateAsync(input.Id);

            var entity = await MapToEntityAsync(input);

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await MapToGetOutputDtoAsync(entity);
        }

        public async Task<ListResultDto<TipoPagoDto>> GetLookupAsync()
        {
            await CheckGetListPolicyAsync();

            var list = await Repository.GetListAsync();

            return new ListResultDto<TipoPagoDto>(
                ObjectMapper.Map<List<TipoPago>, List<TipoPagoDto>>(list)
            );
        }

    }

}
