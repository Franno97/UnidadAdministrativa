using Microsoft.Extensions.DependencyInjection;
using Mre.Sb.UnidadAdministrativa;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.Modularity;

namespace Mre.Sb.AdministrativeUnit.EntityFrameworkCore
{
    [DependsOn(
        typeof(AdministrativeUnitDomainModule),
        typeof(AbpEntityFrameworkCoreModule)
    )]
    public class AdministrativeUnitEntityFrameworkCoreModule : AbpModule
    {
        public override void ConfigureServices(ServiceConfigurationContext context)
        {
            context.Services.AddAbpDbContext<UnidadAdministrativaDbContext>(options =>
            {
                options.AddDefaultRepositories(includeAllEntities: true);

                /* Add custom repositories here. Example:
                 * options.AddRepository<Question, EfCoreQuestionRepository>();
                 */
 
            });
        }
    }
}