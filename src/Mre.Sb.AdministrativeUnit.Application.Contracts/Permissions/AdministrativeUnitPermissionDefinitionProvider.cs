using Mre.Sb.AdministrativeUnit.Localization;
using Volo.Abp.Authorization.Permissions;
using Volo.Abp.Localization;
using Volo.Abp.Reflection;

namespace Mre.Sb.AdministrativeUnit.Permissions
{
    public class AdministrativeUnitPermissionDefinitionProvider : PermissionDefinitionProvider
    {
        public override void Define(IPermissionDefinitionContext context)
        {
            var moduleGroup = context.AddGroup(AdministrativeUnitPermissions.GroupName, L("Permission:AdministrativeUnit"));

            var administrativeUnitTypePermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.AdministrativeUnitType.Default, L("Permission:AdministrativeUnitTypeManagement"));
            administrativeUnitTypePermission.AddChild(AdministrativeUnitPermissions.AdministrativeUnitType.Create, L("Permission:Create"));
            administrativeUnitTypePermission.AddChild(AdministrativeUnitPermissions.AdministrativeUnitType.Update, L("Permission:Edit"));
            administrativeUnitTypePermission.AddChild(AdministrativeUnitPermissions.AdministrativeUnitType.Delete, L("Permission:Delete"));

 
            var serviceTypePermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.ServiceType.Default, L("Permission:ServiceTypeManagement"));
            serviceTypePermission.AddChild(AdministrativeUnitPermissions.ServiceType.Create, L("Permission:Create"));
            serviceTypePermission.AddChild(AdministrativeUnitPermissions.ServiceType.Update, L("Permission:Edit"));
            serviceTypePermission.AddChild(AdministrativeUnitPermissions.ServiceType.Delete, L("Permission:Delete"));

             

            var tariffTypePermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.TariffType.Default, L("Permission:TariffTypeManagement"));
            tariffTypePermission.AddChild(AdministrativeUnitPermissions.TariffType.Create, L("Permission:Create"));
            tariffTypePermission.AddChild(AdministrativeUnitPermissions.TariffType.Update, L("Permission:Edit"));
            tariffTypePermission.AddChild(AdministrativeUnitPermissions.TariffType.Delete, L("Permission:Delete"));




            var bankPermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.Bank.Default, L("Permission:BankManagement"));
            bankPermission.AddChild(AdministrativeUnitPermissions.Bank.Create, L("Permission:Create"));
            bankPermission.AddChild(AdministrativeUnitPermissions.Bank.Update, L("Permission:Edit"));
            bankPermission.AddChild(AdministrativeUnitPermissions.Bank.Delete, L("Permission:Delete"));

 

            var levelPermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.Level.Default, L("Permission:LevelManagement"));
            levelPermission.AddChild(AdministrativeUnitPermissions.Level.Create, L("Permission:Create"));
            levelPermission.AddChild(AdministrativeUnitPermissions.Level.Update, L("Permission:Edit"));
            levelPermission.AddChild(AdministrativeUnitPermissions.Level.Delete, L("Permission:Delete"));

             

            var currencyPermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.Currency.Default, L("Permission:CurrencyManagement"));
            currencyPermission.AddChild(AdministrativeUnitPermissions.Currency.Create, L("Permission:Create"));
            currencyPermission.AddChild(AdministrativeUnitPermissions.Currency.Update, L("Permission:Edit"));
            currencyPermission.AddChild(AdministrativeUnitPermissions.Currency.Delete, L("Permission:Delete"));

             

            var paymentTypePermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.PaymentType.Default, L("Permission:PaymentTypeManagement"));
            paymentTypePermission.AddChild(AdministrativeUnitPermissions.PaymentType.Create, L("Permission:Create"));
            paymentTypePermission.AddChild(AdministrativeUnitPermissions.PaymentType.Update, L("Permission:Edit"));
            paymentTypePermission.AddChild(AdministrativeUnitPermissions.PaymentType.Delete, L("Permission:Delete"));




            var positionPermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.Position.Default, L("Permission:PositionManagement"));
            positionPermission.AddChild(AdministrativeUnitPermissions.Position.Create, L("Permission:Create"));
            positionPermission.AddChild(AdministrativeUnitPermissions.Position.Update, L("Permission:Edit"));
            positionPermission.AddChild(AdministrativeUnitPermissions.Position.Delete, L("Permission:Delete"));



            var bookPermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.Book.Default, L("Permission:BookManagement"));
            bookPermission.AddChild(AdministrativeUnitPermissions.Book.Create, L("Permission:Create"));
            bookPermission.AddChild(AdministrativeUnitPermissions.Book.Update, L("Permission:Edit"));
            bookPermission.AddChild(AdministrativeUnitPermissions.Book.Delete, L("Permission:Delete"));



            var administrativeUnitPermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.AdministrativeUnit.Default, L("Permission:AdministrativeUnitManagement"));
            administrativeUnitPermission.AddChild(AdministrativeUnitPermissions.AdministrativeUnit.Create, L("Permission:Create"));
            administrativeUnitPermission.AddChild(AdministrativeUnitPermissions.AdministrativeUnit.Update, L("Permission:Edit"));
            administrativeUnitPermission.AddChild(AdministrativeUnitPermissions.AdministrativeUnit.Delete, L("Permission:Delete"));



            var agentAttentionPermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.AgentAttention.Default, L("Permission:AgentAttentionManagement"));
            agentAttentionPermission.AddChild(AdministrativeUnitPermissions.AgentAttention.Create, L("Permission:Create"));
            agentAttentionPermission.AddChild(AdministrativeUnitPermissions.AgentAttention.Update, L("Permission:Edit"));
            agentAttentionPermission.AddChild(AdministrativeUnitPermissions.AgentAttention.Delete, L("Permission:Delete"));



            var servicePermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.Service.Default, L("Permission:ServiceManagement"));
            servicePermission.AddChild(AdministrativeUnitPermissions.Service.Create, L("Permission:Create"));
            servicePermission.AddChild(AdministrativeUnitPermissions.Service.Update, L("Permission:Edit"));
            servicePermission.AddChild(AdministrativeUnitPermissions.Service.Delete, L("Permission:Delete"));


            var tariffPermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.Tariff.Default, L("Permission:TariffManagement"));
            tariffPermission.AddChild(AdministrativeUnitPermissions.Tariff.Create, L("Permission:Create"));
            tariffPermission.AddChild(AdministrativeUnitPermissions.Tariff.Update, L("Permission:Edit"));
            tariffPermission.AddChild(AdministrativeUnitPermissions.Tariff.Delete, L("Permission:Delete"));



            var tariffHierarchyPermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.TariffHierarchy.Default, L("Permission:TariffHierarchyManagement"));
            tariffHierarchyPermission.AddChild(AdministrativeUnitPermissions.TariffHierarchy.Create, L("Permission:Create"));
            tariffHierarchyPermission.AddChild(AdministrativeUnitPermissions.TariffHierarchy.Update, L("Permission:Edit"));
            tariffHierarchyPermission.AddChild(AdministrativeUnitPermissions.TariffHierarchy.Delete, L("Permission:Delete"));



            var tariffHeadingPermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.TariffHeading.Default, L("Permission:TariffHeadingManagement"));
            tariffHeadingPermission.AddChild(AdministrativeUnitPermissions.TariffHeading.Create, L("Permission:Create"));
            tariffHeadingPermission.AddChild(AdministrativeUnitPermissions.TariffHeading.Update, L("Permission:Edit"));
            tariffHeadingPermission.AddChild(AdministrativeUnitPermissions.TariffHeading.Delete, L("Permission:Delete"));



            var agreementPermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.Agreement.Default, L("Permission:AgreementManagement"));
            agreementPermission.AddChild(AdministrativeUnitPermissions.Agreement.Create, L("Permission:Create"));
            agreementPermission.AddChild(AdministrativeUnitPermissions.Agreement.Update, L("Permission:Edit"));
            agreementPermission.AddChild(AdministrativeUnitPermissions.Agreement.Delete, L("Permission:Delete"));


            //SignatarioConfiguracion
            var signatarioConfiguracionPermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.SignatarioConfiguracion.Default, L("Permission:SignatarioConfiguracion"));
            signatarioConfiguracionPermission.AddChild(AdministrativeUnitPermissions.SignatarioConfiguracion.Delete, L("Permission:Delete"));




            var tipoCuentaBancariaPermission = moduleGroup.AddPermission(AdministrativeUnitPermissions.TipoCuentaBancaria.Default, L("Permission:TipoCuentaBancariaManagement"));
            tipoCuentaBancariaPermission.AddChild(AdministrativeUnitPermissions.TipoCuentaBancaria.Create, L("Permission:Create"));
            tipoCuentaBancariaPermission.AddChild(AdministrativeUnitPermissions.TipoCuentaBancaria.Update, L("Permission:Edit"));
            tipoCuentaBancariaPermission.AddChild(AdministrativeUnitPermissions.TipoCuentaBancaria.Delete, L("Permission:Delete"));



        }

        private static LocalizableString L(string name)
        {
            return LocalizableString.Create<AdministrativeUnitResource>(name);
        }
    }
}