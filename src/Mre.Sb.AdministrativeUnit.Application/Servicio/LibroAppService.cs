using Mre.Sb.UnidadAdministrativa.Dominio;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using Mre.Sb.UnidadAdministrativa.Servicio;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public class LibroAppService :
    CrudAppService<
        Libro,
        LibroDto,
        string>,
    ILibroAppService
    {
        private readonly LibroManager BookManager;

        public LibroAppService(IRepository<Libro, string> repository,
        LibroManager BookManager)
            : base(repository)
        {
            this.BookManager = BookManager;

            //GetPolicyName = AdministrativeUnitPermissions.Libro.Default;
            //GetListPolicyName = AdministrativeUnitPermissions.Libro.Default;
            //CreatePolicyName = AdministrativeUnitPermissions.Libro.Create;
            //UpdatePolicyName = AdministrativeUnitPermissions.Libro.Update;
            //DeletePolicyName = AdministrativeUnitPermissions.Libro.Delete;
        }

        public override async Task<LibroDto> CreateAsync(LibroDto input)
        {
            await CheckCreatePolicyAsync();

            await BookManager.ValidateCreateAsync(input.Id);

            var entity = await MapToEntityAsync(input);

            TryToSetTenantId(entity);

            await Repository.InsertAsync(entity, autoSave: true);

            return await MapToGetOutputDtoAsync(entity);
        }

        public async Task<ListResultDto<LibroLookupDto>> GetLookupAsync()
        {
            await CheckGetListPolicyAsync();

            var list = await Repository.GetListAsync();

            return new ListResultDto<LibroLookupDto>(
                ObjectMapper.Map<List<Libro>, List<LibroLookupDto>>(list)
            );
        }

    }

}
