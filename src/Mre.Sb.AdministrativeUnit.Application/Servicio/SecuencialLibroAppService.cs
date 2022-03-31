using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class SecuencialLibroAppService :
      CrudAppService<
          SecuencialLibro,
          SecuencialLibroDto,
          Guid,
          PagedAndSortedResultRequestDto,
          CrearActualizarSecuencialLibroDto>,
      ISecuencialLibroAppService
    {
        private readonly SecuencialLibroManager sequentialBookManager;

        public SecuencialLibroAppService(IRepository<SecuencialLibro, Guid> repository,
        SecuencialLibroManager sequentialBookManager)
            : base(repository)
        {
            this.sequentialBookManager = sequentialBookManager;

            //GetPolicyName = AdministrativeUnitPermissions.Ventanilla.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.Ventanilla.Default;
            //CreatePolicyName = AdministrativeUnitPermissions.Ventanilla.Create;
            //UpdatePolicyName = AdministrativeUnitPermissions.Ventanilla.Update;
            //DeletePolicyName = AdministrativeUnitPermissions.Ventanilla.Delete;
        }

        public override async Task<SecuencialLibroDto> GetAsync(Guid id)
        {
            await CheckGetPolicyAsync();

            var queryable = await Repository.GetQueryableAsync();
            queryable = queryable.Where(a => a.Id == id);

            var queryableDto = queryable.Select(entity => new SecuencialLibroDto()
            {
                Id = entity.Id,
                ServicioId = entity.ServicioId,
                UnidadAdministrativaId = entity.UnidadAdministrativaId,
                LibroId = entity.LibroId,
                Libro = entity.Libro.Nombre,
                NumeroPaginaPorVolumen = entity.NumeroPaginaPorVolumen,
                VolumenActual = entity.VolumenActual,
                SiguientePagina = entity.SiguientePagina,
                Anio = entity.Anio
            });

            var entityDto = await AsyncExecuter.FirstOrDefaultAsync(queryableDto);

            return entityDto;
        }

        public override async Task<PagedResultDto<SecuencialLibroDto>> GetListAsync(PagedAndSortedResultRequestDto input)
        {

            await CheckGetListPolicyAsync();

            var queryable = await CreateFilteredQueryAsync(input);

            var totalCount = await AsyncExecuter.CountAsync(queryable);

            queryable = ApplySorting(queryable, input);
            queryable = ApplyPaging(queryable, input);

            var queryableDto = queryable.Select(entity => new SecuencialLibroDto()
            {
                Id = entity.Id,
                ServicioId = entity.ServicioId,
                UnidadAdministrativaId = entity.UnidadAdministrativaId,
                LibroId = entity.LibroId,
                Libro = entity.Libro.Nombre,
                NumeroPaginaPorVolumen = entity.NumeroPaginaPorVolumen,
                VolumenActual = entity.VolumenActual,
                SiguientePagina = entity.SiguientePagina,
                Anio = entity.Anio
            });

            var entityDtos = await AsyncExecuter.ToListAsync(queryableDto);

            return new PagedResultDto<SecuencialLibroDto>(
                totalCount,
                entityDtos
            );
        }

        public async Task<PagedResultDto<SecuencialLibroDto>> GetByAdministrativeUnitServiceAsync(Guid serviceId, Guid administrativeUnitId)
        {
            await CheckGetPolicyAsync();

            var queryable = await Repository.GetQueryableAsync();
            queryable = queryable.Where(a => a.ServicioId == serviceId);
            queryable = queryable.Where(a => a.UnidadAdministrativaId == administrativeUnitId);

            var totalCount = await AsyncExecuter.CountAsync(queryable);

            var queryableDto = queryable.Select(entity => new SecuencialLibroDto()
            {
                Id = entity.Id,
                ServicioId = entity.ServicioId,
                UnidadAdministrativaId = entity.UnidadAdministrativaId,
                LibroId = entity.LibroId,
                Libro = entity.Libro.Nombre,
                NumeroPaginaPorVolumen = entity.NumeroPaginaPorVolumen,
                VolumenActual = entity.VolumenActual,
                SiguientePagina = entity.SiguientePagina,
                Anio = entity.Anio
            });

            var entityDtos = await AsyncExecuter.ToListAsync(queryableDto);

            return new PagedResultDto<SecuencialLibroDto>(
                totalCount,
                entityDtos
            );
        }

        public override async Task<SecuencialLibroDto> CreateAsync(CrearActualizarSecuencialLibroDto input)
        {
            await CheckCreatePolicyAsync();

            var entity = await sequentialBookManager.CreateAsync(GuidGenerator.Create(),
                serviceId: input.ServicioId,
                administrativeUnitId: input.UnidadAdministrativaId,
                bookId: input.LibroId,
                numberPageByVolume: input.NumeroPaginaPorVolumen,
                currentVolume: input.VolumenActual,
                nextPage: input.SiguientePagina,
                year: input.Anio);

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await GetAsync(entity.Id);
        }

        public override async Task<SecuencialLibroDto> UpdateAsync(Guid id, CrearActualizarSecuencialLibroDto input)
        {
            await CheckUpdatePolicyAsync();

            var entity = await GetEntityByIdAsync(id);


            await MapToEntityAsync(input, entity);
            await Repository.UpdateAsync(entity, autoSave: true);

            return await GetAsync(entity.Id);
        }
    }
}
