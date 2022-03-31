using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class GetConvenioInput : PagedAndSortedResultRequestDto
    {
        public string Filter { get; set; }
    }

}
