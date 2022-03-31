using Microsoft.Extensions.DependencyInjection;
using Mre.Sb.UnidadAdministrativa;
using Volo.Abp.Http.Client;
using Volo.Abp.Modularity;

namespace Mre.Sb.AdministrativeUnit
{
    [DependsOn(
        typeof(AdministrativeUnitApplicationContractsModule),
        typeof(AbpHttpClientModule))]
    public class AdministrativeUnitHttpApiClientModule : AbpModule
    {
        public const string RemoteServiceName = "UnidadAdministrativa";

        public override void ConfigureServices(ServiceConfigurationContext context)
        {
            context.Services.AddHttpClientProxies(
                typeof(AdministrativeUnitApplicationContractsModule).Assembly,
                RemoteServiceName
            );
        }
    }
}
