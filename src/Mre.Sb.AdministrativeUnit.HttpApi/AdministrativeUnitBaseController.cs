using Mre.Sb.AdministrativeUnit.Localization;
using Volo.Abp.AspNetCore.Mvc;

namespace Mre.Sb.UnidadAdministrativa
{
    public abstract class AdministrativeUnitBaseController : AbpController
    {
        protected AdministrativeUnitBaseController()
        {
            LocalizationResource = typeof(AdministrativeUnitResource);
        }
    }
}
