using Localization.Resources.AbpUi;
using Mre.Sb.AdministrativeUnit.Localization;
using Volo.Abp.AspNetCore.Mvc;
using Volo.Abp.Localization;
using Volo.Abp.Modularity;
using Microsoft.Extensions.DependencyInjection;

namespace Mre.Sb.UnidadAdministrativa
{
    [DependsOn(
        typeof(AdministrativeUnitApplicationContractsModule),
        typeof(AbpAspNetCoreMvcModule))]
    public class AdministrativeUnitHttpApiModule : AbpModule
    {
        public override void PreConfigureServices(ServiceConfigurationContext context)
        {
            PreConfigure<IMvcBuilder>(mvcBuilder =>
            {
                mvcBuilder.AddApplicationPartIfNotExists(typeof(AdministrativeUnitHttpApiModule).Assembly);
            });
        }

        public override void ConfigureServices(ServiceConfigurationContext context)
        {
            Configure<AbpLocalizationOptions>(options =>
            {
                options.Resources
                    .Get<AdministrativeUnitResource>()
                    .AddBaseTypes(typeof(AbpUiResource));
            });


            
        }

       
    }
}
