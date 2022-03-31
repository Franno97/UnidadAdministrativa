using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.Linq;
using System.Threading.Tasks;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using System.Linq.Dynamic.Core;
using System.Collections.Generic;
using Volo.Abp;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    [RemoteService(false)]
    public class ConfiguracionSignatarioAppService : ApplicationService, IConfiguracionSignatarioAppService
    {
        private readonly IRepository<ConfiguracionSignatario, Guid> repository;
        private readonly ConfiguracionSignatarioManager configuracionSignatarioManager;

        protected virtual string GetPolicyName { get; set; }

        protected virtual string CreatePolicyName { get; set; }

        protected virtual string UpdatePolicyName { get; set; }

        protected virtual string DeletePolicyName { get; set; }


        public ConfiguracionSignatarioAppService(IRepository<ConfiguracionSignatario, Guid> repository,
            ConfiguracionSignatarioManager configuracionSignatarioManager)
        {
            this.repository = repository;
            this.configuracionSignatarioManager = configuracionSignatarioManager;
        }

        public async Task<ConfiguracionSignatarioDto> GetAsync(Guid usuarioId)
        {
            await CheckGetPolicyAsync();

            var consulta = await repository.GetQueryableAsync();
            consulta = consulta.Where(a => a.UsuarioId == usuarioId);

            var consultaDto = consulta.Select(entity => new ConfiguracionSignatarioDto()
            {
                Id = entity.Id, 
                Clave = entity.Clave,
                Data = entity.Data,
                Extension = entity.Extension,
                NombreArchivo = entity.NombreArchivo,
                TipoContenido = entity.TipoContenido,
                UsuarioId = entity.UsuarioId
            });
             
            var entityDto = await AsyncExecuter.SingleOrDefaultAsync(consultaDto);


            return entityDto;
        }

        public async Task<ConfiguracionSignatarioDto> CreateAsync(ConfiguracionSignatarioDto input)
        {
            await CheckCreatePolicyAsync();

            var entidad = new ConfiguracionSignatario(
                 id: GuidGenerator.Create(),
                  usuarioId: input.UsuarioId , 
                  nombreArchivo: input.NombreArchivo, 
                  tipoContenido: input.TipoContenido,
                  extension: input.Extension, 
                  data: input.Data, 
                  clave: input.Clave
                );

            await repository.InsertAsync(entidad);

            return await GetAsync(input.UsuarioId);

        }

      
        public async Task<ConfiguracionSignatarioDto> UpdateAsync(Guid id, ConfiguracionSignatarioDto input)
        {
            await CheckUpdatePolicyAsync();
            
            var consulta = await repository.GetQueryableAsync();
            consulta = consulta.Where(a => a.UsuarioId == input.UsuarioId);

            var entidad = await AsyncExecuter.SingleAsync(consulta);
 
            await MapToEntityAsync(input, entidad);
            await repository.UpdateAsync(entidad);

            return await GetAsync(input.UsuarioId);
        }

        public async Task DeleteAsync(Guid usuarioId)
        {
            await CheckDeletePolicyAsync();

            var consulta = await repository.GetQueryableAsync();
            consulta = consulta.Where(a => a.UsuarioId == usuarioId);

            var entidad = await AsyncExecuter.SingleAsync(consulta);

            await repository.DeleteAsync(entidad);
        }


        public  Task<List<Guid>> PoseenConfiguracionAsync(List<Guid> usuariosIds)
        {  
            return configuracionSignatarioManager.PoseenConfiguracionAsync(usuariosIds);
        }

        public Task<bool> PoseenConfiguracionAsync(Guid usuariosId)
        {
            return configuracionSignatarioManager.PoseenConfiguracionAsync(usuariosId);
        }


        #region Soporte

        protected virtual async Task CheckGetPolicyAsync()
        {
            await CheckPolicyAsync(GetPolicyName);
        }

        protected virtual async Task CheckCreatePolicyAsync()
        {
            await CheckPolicyAsync(CreatePolicyName);
        }

        protected virtual async Task CheckUpdatePolicyAsync()
        {
            await CheckPolicyAsync(UpdatePolicyName);
        }

        protected virtual async Task CheckDeletePolicyAsync()
        {
            await CheckPolicyAsync(DeletePolicyName);

            

        }

        /// <summary>
        /// Maps <typeparamref name="TUpdateInput"/> to <typeparamref name="TEntity"/> to update the entity.
        /// It uses <see cref="MapToEntity(TUpdateInput, TEntity)"/> by default.
        /// It can be overriden for custom mapping.
        /// Overriding this has higher priority than overriding the <see cref="MapToEntity(TUpdateInput, TEntity)"/>
        /// </summary>
        protected virtual Task MapToEntityAsync(ConfiguracionSignatarioDto updateInput, ConfiguracionSignatario entity)
        {
            MapToEntity(updateInput, entity);
            return Task.CompletedTask;
        }

        /// <summary>
        /// Maps <typeparamref name="TUpdateInput"/> to <typeparamref name="TEntity"/> to update the entity.
        /// It uses <see cref="IObjectMapper"/> by default.
        /// It can be overriden for custom mapping.
        /// </summary>
        protected virtual void MapToEntity(ConfiguracionSignatarioDto updateInput, ConfiguracionSignatario entity)
        {
            ObjectMapper.Map(updateInput, entity);
        }

       
        #endregion Soporte
    }
}
