using Microsoft.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore;

namespace Mre.Sb.AdministrativeUnit.EntityFrameworkCore
{
    public class AdministrativeUnitHttpApiHostMigrationsDbContext : AbpDbContext<AdministrativeUnitHttpApiHostMigrationsDbContext>
    {
        public AdministrativeUnitHttpApiHostMigrationsDbContext(DbContextOptions<AdministrativeUnitHttpApiHostMigrationsDbContext> options)
            : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.ConfigureAdministrativeUnit();
        }
    }
}
