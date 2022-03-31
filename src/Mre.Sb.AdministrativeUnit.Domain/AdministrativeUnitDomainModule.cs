using Volo.Abp.Domain;
using Volo.Abp.Modularity;

namespace Mre.Sb.UnidadAdministrativa
{
    [DependsOn(
        typeof(AbpDddDomainModule),
        typeof(AdministrativeUnitDomainSharedModule)
    )]
    public class AdministrativeUnitDomainModule : AbpModule
    {

    }
}
