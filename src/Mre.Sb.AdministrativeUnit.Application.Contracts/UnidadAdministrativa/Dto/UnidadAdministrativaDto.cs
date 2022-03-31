using System;
using System.Collections.Generic;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public class UnidadAdministrativaDto : IEntityDto<Guid>
    {
       

        public Guid Id { get; set; }

        public virtual string TipoUnidadAdministrativaId { get; set; }

        public virtual string TipoUnidadAdministrativa { get; set; }

        public virtual Guid? DependenciaAdministrativaId { get; set; }

        public virtual string DependenciaAdministrativa { get; set; }

        public virtual string Nombre { get; set; }

        public virtual string Siglas { get; set; }

        public virtual string Codigo { get; set; }

        
        public virtual string PaisId { get; set; }

        public virtual string Pais { get; set; }

        public virtual string RegionId { get; set; }

        public virtual string Region { get; set; }

        public virtual string Ciudad { get; set; }

        public virtual string SubRegion { get; set; }

        public virtual string Direccion { get; set; }

        public virtual string CodigoPostal { get; set; }
      
        public virtual string BancoId { get; set; }

        public virtual string Banco { get; set; }

        public virtual string MonedaId { get; set; }

        public virtual string Moneda { get; set; }

        public virtual DateTime? FechaInicioOperacion { get; set; }

        public virtual DateTime? FechaFinOperacion { get; set; }

        public virtual bool Activo { get; set; }

        public virtual string NivelId { get; set; }

        public virtual string Nivel { get; set; }

        public virtual string Observaciones { get; set; }

       
        public virtual IEnumerable<string> Jurisdiccion { get;  set; }


        public virtual string TipoCuentaBancariaId { get; set; }

        public virtual string TipoCuentaBancaria { get; set; }

        public virtual string TitularCuentaBancaria { get; set; }

        public virtual string NumeroCuentaBancaria { get; set; }

    }
}
