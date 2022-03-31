using Volo.Abp.Modularity;
using Volo.Abp.Localization;
using Mre.Sb.AdministrativeUnit.Localization;
using Volo.Abp.Localization.ExceptionHandling;
using Volo.Abp.Validation;
using Volo.Abp.Validation.Localization;
using Volo.Abp.VirtualFileSystem;

namespace Mre.Sb.UnidadAdministrativa
{
    [DependsOn(
        typeof(AbpValidationModule)
    )]
    public class AdministrativeUnitDomainSharedModule : AbpModule
    {
        public override void ConfigureServices(ServiceConfigurationContext context)
        {
            Configure<AbpVirtualFileSystemOptions>(options =>
            {
                options.FileSets.AddEmbedded<AdministrativeUnitDomainSharedModule>();
            });

            Configure<AbpLocalizationOptions>(options =>
            {
                options.Resources
                    .Add<AdministrativeUnitResource>("es")
                    .AddBaseTypes(typeof(AbpValidationResource))
                    .AddVirtualJson("/Localization/AdministrativeUnit");
            });

            Configure<AbpExceptionLocalizationOptions>(options =>
            {
                options.MapCodeNamespace("AdministrativeUnit", typeof(AdministrativeUnitResource));
            });
        }
    }
}
