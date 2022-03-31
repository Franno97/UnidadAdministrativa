using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using Volo.Abp;
using Volo.Abp.Domain.Entities.Auditing;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{


    /// <summary>
    /// Entidad que permite administrar la información de una unidad administrativa
    /// </summary>
    public class UnidadAdministrativa : FullAuditedAggregateRoot<Guid> {

        protected UnidadAdministrativa()
        {
            
        }


        public UnidadAdministrativa(Guid id, string name, string administrativeUnitTypeId, Guid? administrativeDependencyId, string acronym, string countryId, string regionId, string city, string address, string zipCode, string bankId, string currencyId, DateTime? operationStartDate, DateTime? operationEndDate, string levelId, bool isActive, string observations, string tipoCuentaBancariaId, string titularCuentaBancaria, string numeroCuentaBancaria, string codigo)
        {
            Id = id;
            TipoUnidadAdministrativaId = administrativeUnitTypeId;
            DependenciaAdministrativaId = administrativeDependencyId;
            Nombre = name;
            Siglas = acronym;
            PaisId = countryId;
            RegionId = regionId;
            Ciudad = city;
            Direccion = address;
            CodigoPostal = zipCode;

            MonedaId = currencyId;
            FechaInicioOperacion = operationStartDate;
            FechaFinOperacion = operationEndDate;
            Activo = isActive;
            NivelId = levelId;
            Observaciones = observations;


            BancoId = bankId;
            TipoCuentaBancariaId = tipoCuentaBancariaId;
            TitularCuentaBancaria = titularCuentaBancaria;
            NumeroCuentaBancaria = numeroCuentaBancaria;
            Codigo = codigo;
        }

        [Required]
        public string TipoUnidadAdministrativaId { get; set; }

        public TipoUnidadAdministrativa TipoUnidadAdministrativa { get; set; }

        public Guid? DependenciaAdministrativaId { get; set; }

        public UnidadAdministrativa DependenciaAdministrativa { get; set; }

        [Required]
        [StringLength(UnidadAdministrativaConsts.MaxCodigoLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public virtual string Codigo { get; protected set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public virtual string Nombre { get; protected set; }

        [Required]
        [StringLength(UnidadAdministrativaConsts.MaxAcronymLength)]
        public virtual string Siglas { get; protected set; }


        [Required]
        [StringLength(DomainCommonConsts.MaxGeographicalIdLength)]
        public string PaisId { get;  set; }

    

        [Required]
        [StringLength(DomainCommonConsts.MaxGeographicalIdLength)]
        public string RegionId { get;  set; }


        [Required]
        [StringLength(DomainCommonConsts.MaxAddressLength)]
        public string Ciudad { get; set; }


        [StringLength(DomainCommonConsts.MaxAddressLength)]
        public string Direccion { get;  set; }


        [StringLength(UnidadAdministrativaConsts.MaxCodigoPostal)]
        public string CodigoPostal { get;  set; }


        [Required]
        public string BancoId { get; set; }
 

        public Banco Banco { get; set; }

        [Required]
        [StringLength(UnidadAdministrativaConsts.MaxNumeroCuentaBancariaLength)]
        public string NumeroCuentaBancaria { get; set; }

        [Required]
        public string TipoCuentaBancariaId { get; set; }

        public TipoCuentaBancaria TipoCuentaBancaria { get; set; }


        [Required]
        [StringLength(UnidadAdministrativaConsts.MaxTitularCuentaBancariaLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.AlfanumericosGuionesPuntoEspacio)]
        public string TitularCuentaBancaria { get; set; }

        [Required]
        public string MonedaId { get; set; }

       
        public Moneda Moneda { get; set; }

        
        public DateTime? FechaInicioOperacion { get;  set; }

        public DateTime? FechaFinOperacion { get;  set; }

        public bool Activo { get; set; }

        public string NivelId { get; set; }

        public Nivel Nivel { get; set; }


        public string Observaciones { get; set; }


        public Guid? JefeMisionId { get; set; }


        public virtual ICollection<UnidadAdministrativaFuncionario> Funcionarios { get; protected set; } = new List<UnidadAdministrativaFuncionario>();


        public virtual ICollection<UnidadAdministrativaServicio> Servicios { get; protected set; } = new List<UnidadAdministrativaServicio>();


        public virtual ICollection<Jurisdiccion> Jurisdiccion { get; protected set; } = new List<Jurisdiccion>();


        public virtual ICollection<Signatario> Signatarios { get; protected set; } = new List<Signatario>();


        public void AgregarFuncionario(Guid usuarioId, string cargoId)
        {
            Check.NotNull(usuarioId, nameof(usuarioId));
            Check.NotNull(cargoId, nameof(cargoId));

            Funcionarios.Add(new UnidadAdministrativaFuncionario(this.Id, usuarioId, cargoId));
        }

        public void EliminarFuncionario(Guid usuarioId)
        {
            Funcionarios.RemoveAll(f => f.UsuarioId == usuarioId);
        }

        public void AgregarServicio(Guid serviceId, string paymentTypeId, bool isActive)
        {
            Check.NotNull(serviceId, nameof(serviceId));
            Check.NotNull(paymentTypeId, nameof(paymentTypeId));
             
            Servicios.Add(new UnidadAdministrativaServicio(this.Id, serviceId, paymentTypeId, isActive));
        }

        public void EliminarServicio(Guid serviceId)
        {
             Servicios.RemoveAll(s => s.ServicioId == serviceId);
             
        }
         
        public void CambiarNombre(string newName)
        {
            this.Nombre = newName;
        }

        public void ChangeState(bool isActive)
        {
            this.Activo = isActive;
        }

        public void CambiarSigla(string sigla)
        {
            this.Siglas = sigla;
        }

        public void CambiarCodigo(string codigo)
        {
            this.Codigo = codigo;
        }

        public void AddMissionChief(Guid jefeMisionId)
        {
            JefeMisionId = jefeMisionId;
        }

        public void AgregarSignatario(Guid userId, Guid serviceId, bool porDefecto = false)
        {
            Check.NotNull(serviceId, nameof(serviceId));
            Check.NotNull(userId, nameof(userId));

            Signatarios.Add(new Signatario(this.Id, userId, serviceId, porDefecto));
        }

        public void EliminarSignatario(Guid userId, Guid serviceId)
        {
            Signatarios.RemoveAll(s => s.UsuarioId == userId && s.ServicioId == serviceId);
        }


        public void AgregarJurisdiccion(IEnumerable<string> ciudadesJurisdiccion)
        {
            Check.NotNull(ciudadesJurisdiccion, nameof(ciudadesJurisdiccion));

            foreach (var ciudad in ciudadesJurisdiccion)
            {
                Jurisdiccion.Add(new Jurisdiccion(this.Id, ciudad));
            }
          
        }

        public void EliminarJurisdiccion(IEnumerable<string> ciudadesJurisdiccion)
        {
             Check.NotNull(ciudadesJurisdiccion, nameof(ciudadesJurisdiccion));

            var jurisdiccionEliminar = new List<Jurisdiccion>();
            foreach (var ciudad in ciudadesJurisdiccion)
            {
                var jurisdiccion = Jurisdiccion.SingleOrDefault(j => j.Ciudad == ciudad.ToUpper());
                if (jurisdiccion == null) {
                    throw new UserFriendlyException(string.Format("La jurisdicción: {0} no existe en unidad administrativa", Ciudad));
                }
                jurisdiccionEliminar.Add(jurisdiccion);
              
            }

            if (jurisdiccionEliminar.Any()) {
                Jurisdiccion.RemoveAll(jurisdiccionEliminar);
            }
        }

    }
}
