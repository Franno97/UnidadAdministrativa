using Mre.Sb.AdministrativeUnit.Localization;
using Volo.Abp.Application.Services;

namespace Mre.Sb.UnidadAdministrativa
{
    public abstract class AdministrativeUnitAppService : ApplicationService
    {
        protected AdministrativeUnitAppService()
        {
            LocalizationResource = typeof(AdministrativeUnitResource);
            ObjectMapperContext = typeof(AdministrativeUnitApplicationModule);
        }
    }
}
