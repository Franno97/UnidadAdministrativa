using Mre.Sb.AdministrativeUnit.EntityFrameworkCore;
using Volo.Abp.Modularity;

namespace Mre.Sb.AdministrativeUnit
{
    /* Domain tests are configured to use the EF Core provider.
     * You can switch to MongoDB, however your domain tests should be
     * database independent anyway.
     */
    [DependsOn(
        typeof(AdministrativeUnitEntityFrameworkCoreTestModule)
        )]
    public class AdministrativeUnitDomainTestModule : AbpModule
    {
        
    }
}
