using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class GetPartidaArancelariaInput : PagedAndSortedResultRequestDto
    {
        public string Filter { get; set; }
    }

}
