using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Domain.Services;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    public class ConfiguracionSignatarioManager : DomainService
    {
        private readonly IRepository<ConfiguracionSignatario, Guid> repository;

        public ConfiguracionSignatarioManager(IRepository<ConfiguracionSignatario, Guid> repository)
        {
            this.repository = repository;
        }

        public async Task<bool> PoseenConfiguracionAsync(Guid usuariosId)
        {
            var consulta = await repository.GetQueryableAsync();
            consulta = consulta.Where(x => x.UsuarioId == usuariosId);

            var resultado = await AsyncExecuter.AnyAsync(consulta);

            return resultado;
        }

        public async Task<List<Guid>> PoseenConfiguracionAsync(List<Guid> usuariosIds)
        {
            var consulta = await repository.GetQueryableAsync();
            consulta = consulta.Where(x => usuariosIds.Contains(x.UsuarioId));

            var consultaResultado = consulta.Select(x => x.UsuarioId);

            var resultado = await AsyncExecuter.ToListAsync(consultaResultado);

            return resultado;
        }

    }
}
