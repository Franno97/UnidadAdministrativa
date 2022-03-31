using Microsoft.EntityFrameworkCore;
using Mre.Sb.UnidadAdministrativa;
using Mre.Sb.UnidadAdministrativa.Dominio;
using Volo.Abp.Data;
using Volo.Abp.EntityFrameworkCore;

namespace Mre.Sb.AdministrativeUnit.EntityFrameworkCore
{
    [ConnectionStringName(UnidadAdministrativaDbProperties.ConnectionStringName)]
    public interface IUnidadAdministrativaDbContext : IEfCoreDbContext
    {
        DbSet<TipoUnidadAdministrativa> TipoUnidadAdministrativa { get; }

        DbSet<UnidadAdministrativa.Dominio.UnidadAdministrativa> UnidadAdministrativa { get; }


        DbSet<Servicio> Servicio { get; }

        DbSet<TipoServicio> TipoServicio { get; }



        DbSet<Moneda> Moneda { get; }

        DbSet<Banco> Banco { get; }

        DbSet<Nivel> Nivel { get; }


        DbSet<Ventanilla> Ventanilla { get; }

        DbSet<TipoAtencion> TipoAtencion { get; }

        DbSet<Cargo> Cargo { get; }

        DbSet<TipoPago> TipoPago { get; }

        DbSet<UnidadAdministrativaFuncionario> UnidadAdministrativaFuncionario { get; }

        DbSet<Signatario> Signatario { get; }
         
        DbSet<ConfiguracionSignatario> ConfiguracionSignatario { get;  }

        DbSet<UnidadAdministrativaServicio> UnidadAdministrativaServicio { get; }

        #region Arancel

        DbSet<TipoArancel> TipoArancel { get; }

        DbSet<Arancel> Arancel { get; }

        DbSet<PartidaArancelaria> PartidaArancelaria { get; }

        DbSet<JerarquiaArancelaria> JerarquiaArancelaria { get; }

        DbSet<PartidaArancelariaServicio> PartidaArancelariaServicio { get; }

        DbSet<TipoExoneracion> TipoExoneracion { get; }

        DbSet<EntidadAuspiciante> EntidadAuspiciante { get; }

        DbSet<Exoneracion> Exoneracion { get; }

        DbSet<Convenio> Convenio { get; }

        #endregion Arancel

        DbSet<Libro> Libro { get; }

        DbSet<SecuencialLibro> SecuencialLibro { get; }
        DbSet<TipoCuentaBancaria> TipoCuentaBancaria { get; }


        
    }
}