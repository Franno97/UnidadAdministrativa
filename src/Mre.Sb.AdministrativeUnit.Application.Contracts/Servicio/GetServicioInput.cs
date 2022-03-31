using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class GetServicioInput : PagedAndSortedResultRequestDto
    {
        public string Filter { get; set; }
    }

}
