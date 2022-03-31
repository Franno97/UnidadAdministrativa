using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Volo.Abp.Domain.Entities.Auditing;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    /// <summary>
    /// Entidad Secuencial de libro que permite administrar el almacenamiento fisico de los docuemntos resultantes de los servicios consulares que se han brindado
    /// </summary>
    public class SecuencialLibro : AuditedAggregateRoot<Guid>
    {
        protected SecuencialLibro()
        {

        }

        public SecuencialLibro(Guid id, Guid serviceId, Guid administrativeUnitId, string bookId, int numberPageByVolume, int currentVolume, int nextPage, int year)
        {
            Id = id;
            ServicioId = serviceId;
            UnidadAdministrativaId = administrativeUnitId;
            LibroId = bookId;
            NumeroPaginaPorVolumen = numberPageByVolume;
            VolumenActual = currentVolume;
            SiguientePagina = nextPage;
            Anio = year;

        }

        [Required]
        public Guid ServicioId { get; set; }
 
        public Guid UnidadAdministrativaId { get; set; }

        [Required]
        public string LibroId { get; set; }

        public Libro Libro { get; set; }

        [Required]
        public int NumeroPaginaPorVolumen { get; set; }

        [Required]
        public int VolumenActual { get; set; }
        
        public int SiguientePagina { get; set; }
        
        public int Anio { get; set; }
    }
}
