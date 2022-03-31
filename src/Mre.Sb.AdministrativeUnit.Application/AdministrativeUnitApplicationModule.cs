using Microsoft.Extensions.DependencyInjection;
using Volo.Abp.AutoMapper;
using Volo.Abp.Modularity;
using Volo.Abp.Application;
using Mre.Sb.Geographical;
using Volo.Abp.FluentValidation;

namespace Mre.Sb.UnidadAdministrativa
{
    [DependsOn(
        typeof(AdministrativeUnitDomainModule),
        typeof(AdministrativeUnitApplicationContractsModule),
        typeof(AbpDddApplicationModule),
        typeof(AbpAutoMapperModule)
        )]
    [DependsOn(typeof(AbpFluentValidationModule))]
    public class AdministrativeUnitApplicationModule : AbpModule
    {
        public override void ConfigureServices(ServiceConfigurationContext context)
        {
            context.Services.AddAutoMapperObjectMapper<AdministrativeUnitApplicationModule>();
            Configure<AbpAutoMapperOptions>(options =>
            {
                options.AddMaps<AdministrativeUnitApplicationModule>(validate: true);
            });

            //Data Geographical
            context.Services.AddSingleton<CountryData>();
        }


    }
}
