using Mre.Sb.UnidadAdministrativa;
using Volo.Abp.Modularity;

namespace Mre.Sb.AdministrativeUnit
{
    [DependsOn(
        typeof(AdministrativeUnitApplicationModule),
        typeof(AdministrativeUnitDomainTestModule)
        )]
    public class AdministrativeUnitApplicationTestModule : AbpModule
    {

    }
}
