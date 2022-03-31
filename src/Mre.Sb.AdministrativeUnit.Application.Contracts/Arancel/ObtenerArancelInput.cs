using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class ObtenerArancelInput : PagedAndSortedResultRequestDto
    {
        public string Filter { get; set; }
    }

}
