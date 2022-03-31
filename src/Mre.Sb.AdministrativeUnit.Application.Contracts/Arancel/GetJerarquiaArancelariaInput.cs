using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class GetJerarquiaArancelariaInput : PagedAndSortedResultRequestDto
    {
        public string Filter { get; set; }
    }

}
