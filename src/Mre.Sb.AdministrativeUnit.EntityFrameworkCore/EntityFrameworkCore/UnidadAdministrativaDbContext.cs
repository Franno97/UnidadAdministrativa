using Audit.EntityFramework;
using Microsoft.EntityFrameworkCore;
using Mre.Sb.UnidadAdministrativa;
using Mre.Sb.UnidadAdministrativa.Dominio;
using Volo.Abp.Data;
using Volo.Abp.EntityFrameworkCore;

namespace Mre.Sb.AdministrativeUnit.EntityFrameworkCore
{
    [ConnectionStringName(UnidadAdministrativaDbProperties.ConnectionStringName)]
    public class UnidadAdministrativaDbContext : AbpDbContext<UnidadAdministrativaDbContext>, IUnidadAdministrativaDbContext
    {
         
        public DbSet<TipoUnidadAdministrativa> TipoUnidadAdministrativa { get; set; }

        public DbSet<UnidadAdministrativa.Dominio.UnidadAdministrativa> UnidadAdministrativa { get; set; }

       
        public DbSet<Servicio> Servicio { get; set; }

        public DbSet<TipoServicio> TipoServicio { get; set; }

        

        public DbSet<Moneda> Moneda { get; set; }

        public DbSet<Banco> Banco { get; set; }

        public DbSet<Nivel> Nivel { get; set; }


        public DbSet<Ventanilla> Ventanilla { get; set; }

        public DbSet<TipoAtencion> TipoAtencion { get; set; }

        public DbSet<Cargo> Cargo { get; set; }

        public DbSet<TipoPago> TipoPago { get; set; }

        public DbSet<UnidadAdministrativaFuncionario> UnidadAdministrativaFuncionario { get; set; }

        public DbSet<Signatario> Signatario { get; set; }

        public DbSet<ConfiguracionSignatario> ConfiguracionSignatario { get; set; }

        public DbSet<UnidadAdministrativaServicio> UnidadAdministrativaServicio { get; set; }

        #region Arancel

        public DbSet<TipoArancel> TipoArancel { get; set; }

        public DbSet<Arancel> Arancel { get; set; }

        public DbSet<PartidaArancelaria> PartidaArancelaria { get; set; }

        public DbSet<JerarquiaArancelaria> JerarquiaArancelaria { get; set; }

        public DbSet<PartidaArancelariaServicio> PartidaArancelariaServicio { get; set; }

        public DbSet<TipoExoneracion> TipoExoneracion { get; set; }

        public DbSet<EntidadAuspiciante> EntidadAuspiciante { get; set; }

        public DbSet<Exoneracion> Exoneracion { get; set; }

        public DbSet<Convenio> Convenio { get; set; }

        #endregion Arancel

        public DbSet<Libro> Libro { get; set; }

        public DbSet<SecuencialLibro> SecuencialLibro { get; set; }

        public DbSet<TipoCuentaBancaria> TipoCuentaBancaria { get; }


        public UnidadAdministrativaDbContext(DbContextOptions<UnidadAdministrativaDbContext> options) 
            : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder.ConfigureAdministrativeUnit();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.AddInterceptors(new AuditSaveChangesInterceptor());
        }
    }
}