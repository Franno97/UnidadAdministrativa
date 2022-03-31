using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Ventanilla
{
    public class GetVentanillaInputDto : PagedAndSortedResultRequestDto
    {
        public string Filter { get; set; }
    }
}
