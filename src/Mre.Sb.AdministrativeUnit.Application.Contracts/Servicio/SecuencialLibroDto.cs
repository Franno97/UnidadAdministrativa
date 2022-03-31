using System;
using System.Collections.Generic;
using System.Text;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class SecuencialLibroDto : IEntityDto<Guid>
    {
        public Guid Id { get; set; }
        public Guid ServicioId { get; set; }
        public Guid UnidadAdministrativaId { get; set; }
        public string LibroId { get; set; }
        public string Libro { get; set; }
        public int NumeroPaginaPorVolumen { get; set; }
        public int VolumenActual { get; set; }
        public int SiguientePagina { get; set; }
        public int Anio { get; set; }
    }
}
