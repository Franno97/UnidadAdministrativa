using Microsoft.Extensions.Localization;
using Mre.Sb.AdministrativeUnit.Localization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Domain.Services;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    public class VentanillaManager : DomainService
    {
        private readonly IRepository<Ventanilla, Guid> agentAttentionRepository;
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;

        public VentanillaManager(IRepository<Ventanilla, Guid> agentAttentionRepository, IStringLocalizer<AdministrativeUnitResource> localizer)
        {
            this.agentAttentionRepository = agentAttentionRepository;
            this.localizer = localizer;
        }

        public virtual async Task<Ventanilla> CreateAsync(Guid id, Guid admiministrativeUnitId, string name,
               bool isPresentialAttention, bool isVirtualAttention, string attentionStart, string attentionEnd, bool isActive = true)
        {


            var queryable = await agentAttentionRepository.GetQueryableAsync();
            var existing = queryable.Any(e => e.Nombre.ToUpper() == name.ToUpper());

            if (existing)
            {
                var msg = string.Format(localizer["AgentAttention:NameExist"], name);
                throw new UserFriendlyException(msg);
            }

            var entity = new Ventanilla(id: id, admiministrativeUnitId: admiministrativeUnitId,  name: name, isPresentialAttention: isPresentialAttention, isVirtualAttention: isVirtualAttention, attentionStart: attentionStart, attentionEnd: attentionEnd, isActive: isActive);

            return entity;
        }

        public async Task ChangeNameAsync(
               Ventanilla agentAttention,
               string newName)
        {
            Check.NotNull(agentAttention, nameof(agentAttention));
            Check.NotNullOrWhiteSpace(newName, nameof(newName));

            var queryable = await agentAttentionRepository.GetQueryableAsync();
            var existing = queryable.Any(e => e.Nombre.ToUpper() == newName.ToUpper() &&
                    e.Id == agentAttention.Id);

            if (existing)
            {
                var msg = string.Format(localizer["AgentAttention:NameExist"], newName);
                throw new UserFriendlyException(msg);
            }

            agentAttention.ChangeName(newName);
        }
    }
}
