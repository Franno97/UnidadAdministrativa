using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public class CrearActualizarUnidadAdministrativaDto
    {
        [Required]
        public virtual string TipoUnidadAdministrativaId { get; set; }

        public virtual Guid? DependenciaAdministrativaId { get; set; }

        [Required]
        [StringLength(UnidadAdministrativaConsts.MaxCodigoLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public virtual string Codigo { get; set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public virtual string Nombre { get; set; }

        [Required]
        [StringLength(UnidadAdministrativaConsts.MaxAcronymLength)]
        public virtual string Siglas { get; set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxGeographicalIdLength)]
        public virtual string PaisId { get; set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxGeographicalIdLength)]
        public string RegionId { get; set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxAddressLength)]
        public virtual string Ciudad { get; set; }

        [StringLength(DomainCommonConsts.MaxAddressLength)]
        public virtual string Direccion { get; set; }

        [StringLength(UnidadAdministrativaConsts.MaxCodigoPostal)]
        public virtual string CodigoPostal { get; set; }

        [Required]
        public virtual string BancoId { get; set; }

        [Required]
        [StringLength(UnidadAdministrativaConsts.MaxNumeroCuentaBancariaLength)]
        public string NumeroCuentaBancaria { get; set; }

        [Required]
        public string TipoCuentaBancariaId { get; set; }

        [Required]
        [StringLength(UnidadAdministrativaConsts.MaxTitularCuentaBancariaLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string TitularCuentaBancaria { get; set; }


        [Required]
        public virtual string MonedaId { get; set; }

         

        public virtual DateTime? FechaInicioOperacion { get; set; }

        public virtual DateTime? FechaFinOperacion { get; set; }

        public virtual bool Activo { get; set; }

        public virtual string NivelId { get; set; }

        public virtual string Observaciones { get; set; }


        [Required]
        public virtual ICollection<string> Jurisdiccion { get; set; }


    }
}
