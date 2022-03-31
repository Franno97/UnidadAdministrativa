using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public class GetUnidadAdministrativaInput : PagedAndSortedResultRequestDto
    {
        public string Filter { get; set; }

        public string TipoUnidadAdministrativaId { get; set; }
    }

}
