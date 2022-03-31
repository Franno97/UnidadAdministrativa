using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class GetExoneracionInput : PagedAndSortedResultRequestDto
    {
        private string SortingDefault = "AgreementId";

        public GetExoneracionInput()
        {
            this.Sorting = SortingDefault;
        }

    }

}
