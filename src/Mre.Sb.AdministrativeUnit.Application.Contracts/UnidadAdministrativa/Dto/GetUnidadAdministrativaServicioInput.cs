using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{


    public class GetUnidadAdministrativaServicioInput : PagedAndSortedResultRequestDto
    {
        private readonly string SortingDefault = "UnidadAdministrativaId";

        public GetUnidadAdministrativaServicioInput()
        {
            this.Sorting = SortingDefault;
        }

        //[Required]
        //public Guid UnidadAdministrativaId { get; set; }

        public bool? Activo { get; set; }

    }


}
