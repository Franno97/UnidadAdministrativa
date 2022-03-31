using System;
using System.Collections.Generic;
using System.Text;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class ObtenerPartidaArancelariaServicioInputDto : PagedAndSortedResultRequestDto
    {
        private string SortingDefault = "PartidaArancelariaId";

        public ObtenerPartidaArancelariaServicioInputDto()
        {
            this.Sorting = SortingDefault;
        }
    }
}
