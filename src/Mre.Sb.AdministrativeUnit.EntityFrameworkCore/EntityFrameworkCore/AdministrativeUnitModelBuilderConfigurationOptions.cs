using JetBrains.Annotations;
using Volo.Abp.EntityFrameworkCore.Modeling;

namespace Mre.Sb.AdministrativeUnit.EntityFrameworkCore
{
    public class AdministrativeUnitModelBuilderConfigurationOptions : AbpModelBuilderConfigurationOptions
    {
        public AdministrativeUnitModelBuilderConfigurationOptions(
            [NotNull] string tablePrefix = "",
            [CanBeNull] string schema = null)
            : base(
                tablePrefix,
                schema)
        {

        }
    }
}