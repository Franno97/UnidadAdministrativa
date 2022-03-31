using System.IO;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;

namespace Mre.Sb.AdministrativeUnit.EntityFrameworkCore
{
    public class AdministrativeUnitHttpApiHostMigrationsDbContextFactory : IDesignTimeDbContextFactory<AdministrativeUnitHttpApiHostMigrationsDbContext>
    {
        public AdministrativeUnitHttpApiHostMigrationsDbContext CreateDbContext(string[] args)
        {
            var configuration = BuildConfiguration();

            var builder = new DbContextOptionsBuilder<AdministrativeUnitHttpApiHostMigrationsDbContext>()
                .UseSqlServer(configuration.GetConnectionString("AdministrativeUnit"));

            return new AdministrativeUnitHttpApiHostMigrationsDbContext(builder.Options);
        }

        private static IConfigurationRoot BuildConfiguration()
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", optional: false);

            return builder.Build();
        }
    }
}
