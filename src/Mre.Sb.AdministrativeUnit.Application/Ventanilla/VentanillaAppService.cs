

using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.AdministrativeUnit.Permissions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories; 

namespace Mre.Sb.UnidadAdministrativa.Ventanilla
{
    public class VentanillaAppService :
    CrudAppService<
        Dominio.Ventanilla,
        VentanillaDto,
        Guid,
        GetVentanillaInputDto,
        CrearActualizarVentanillaDto>,
    IVentanillaAppService
    {
        private readonly VentanillaManager agentAttentionManager;

        public VentanillaAppService(IRepository<Dominio.Ventanilla, Guid> repository,
        VentanillaManager agentAttentionManager)
            : base(repository)
        {
            this.agentAttentionManager = agentAttentionManager;

            //GetPolicyName = AdministrativeUnitPermissions.Ventanilla.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.Ventanilla.Default;
            CreatePolicyName = AdministrativeUnitPermissions.AgentAttention.Create;
            UpdatePolicyName = AdministrativeUnitPermissions.AgentAttention.Update;
            DeletePolicyName = AdministrativeUnitPermissions.AgentAttention.Delete;
        }

        public override async Task<VentanillaDto> GetAsync(Guid id)
        {
            await CheckGetPolicyAsync();

            var queryable = await Repository.GetQueryableAsync();
            queryable = queryable.Where(a => a.Id == id);

            var queryableDto = queryable.Select(entity => new VentanillaDto()
            {
                Id = entity.Id,
                Name = entity.Nombre,
                AdministrativeUnitId = entity.UnidadAdministrativaId,
                IsPresentialAttention = entity.AtencionPresencial,
                IsVirtualAttention = entity.AtencionVirtual,
                AttentionStart = entity.InicioAtencion,
                AttentionEnd = entity.FinAtencion,
                IsActive = entity.Activo
            });

            var entityDto = await AsyncExecuter.FirstOrDefaultAsync(queryableDto);

            return entityDto;
        }

        public override async Task<PagedResultDto<VentanillaDto>> GetListAsync(GetVentanillaInputDto input)
        {

            await CheckGetListPolicyAsync();

            var queryable = await CreateFilteredQueryAsync(input);

            queryable = queryable.WhereIf(
                    !input.Filter.IsNullOrWhiteSpace(),
                    u =>
                        u.Nombre.Contains(input.Filter)
                );

            var totalCount = await AsyncExecuter.CountAsync(queryable);

            queryable = ApplySorting(queryable, input);
            queryable = ApplyPaging(queryable, input);

            var queryableDto = queryable.Select(entity => new VentanillaDto()
            {
                Id = entity.Id,
                Name = entity.Nombre,
                AdministrativeUnitId = entity.UnidadAdministrativaId,
                IsPresentialAttention = entity.AtencionPresencial,
                IsVirtualAttention = entity.AtencionVirtual,
                AttentionStart = entity.InicioAtencion,
                AttentionEnd = entity.FinAtencion,
                IsActive = entity.Activo
            });

            var entityDtos = await AsyncExecuter.ToListAsync(queryableDto);

            return new PagedResultDto<VentanillaDto>(
                totalCount,
                entityDtos
            );
        }

        public override async Task<VentanillaDto> CreateAsync(CrearActualizarVentanillaDto input)
        {
            await CheckCreatePolicyAsync();

            var entity = await agentAttentionManager.CreateAsync(GuidGenerator.Create(),
                admiministrativeUnitId: input.UnidadAdministrativaId,
                name: input.Nombre,
                isPresentialAttention: input.AtencionPresencial,
                isVirtualAttention: input.AtencionVirtual,
                attentionStart: input.InicioAtencion,
                attentionEnd: input.FinAtencion,
                isActive: input.Activo);

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await GetAsync(entity.Id);
        }

        public override async Task<VentanillaDto> UpdateAsync(Guid id, CrearActualizarVentanillaDto input)
        {
            await CheckUpdatePolicyAsync();

            var entity = await GetEntityByIdAsync(id);

            if (!entity.Nombre.Equals(input.Nombre, StringComparison.OrdinalIgnoreCase))
            {

                await agentAttentionManager.ChangeNameAsync(entity, input.Nombre);
            }


            await MapToEntityAsync(input, entity);
            await Repository.UpdateAsync(entity, autoSave: true);

            return await GetAsync(entity.Id);
        }

        public async Task<PagedResultDto<VentanillaDto>> ObtenerPorUnidadAdministrativaIdAsync(Guid unidadAdministrativaId)
        {

            await CheckGetListPolicyAsync();

            var queryable = await Repository.GetQueryableAsync();

            queryable = queryable.Where(x => x.UnidadAdministrativaId == unidadAdministrativaId);

            var totalCount = await AsyncExecuter.CountAsync(queryable);

            var queryableDto = queryable.Select(entity => new VentanillaDto()
            {
                Id = entity.Id,
                Name = entity.Nombre,
                AdministrativeUnitId = entity.UnidadAdministrativaId,
                IsPresentialAttention = entity.AtencionPresencial,
                IsVirtualAttention = entity.AtencionVirtual,
                AttentionStart = entity.InicioAtencion,
                AttentionEnd = entity.FinAtencion,
                IsActive = entity.Activo
            });

            var entityDtos = await AsyncExecuter.ToListAsync(queryableDto);

            return new PagedResultDto<VentanillaDto>(
                totalCount,
                entityDtos
            );
        }
    }

}



