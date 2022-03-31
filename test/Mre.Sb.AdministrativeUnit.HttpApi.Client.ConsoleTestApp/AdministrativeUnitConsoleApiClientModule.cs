using Volo.Abp.Http.Client.IdentityModel;
using Volo.Abp.Modularity;

namespace Mre.Sb.AdministrativeUnit
{
    [DependsOn(
        typeof(AdministrativeUnitHttpApiClientModule),
        typeof(AbpHttpClientIdentityModelModule)
        )]
    public class AdministrativeUnitConsoleApiClientModule : AbpModule
    {
        
    }
}
