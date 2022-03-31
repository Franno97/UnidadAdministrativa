using Volo.Abp.Application;
using Volo.Abp.Modularity;
using Volo.Abp.Authorization;

namespace Mre.Sb.UnidadAdministrativa
{
    [DependsOn(
        typeof(AdministrativeUnitDomainSharedModule),
        typeof(AbpDddApplicationContractsModule),
        typeof(AbpAuthorizationModule)
        )]
    public class AdministrativeUnitApplicationContractsModule : AbpModule
    {

    }
}
