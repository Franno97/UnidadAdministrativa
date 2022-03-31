using Volo.Abp.Reflection;

namespace Mre.Sb.AdministrativeUnit.Permissions
{
    public static class AdministrativeUnitPermissions
    {
        public const string GroupName = "AdministrativeUnit";


        public static class AdministrativeUnitType
        {
            public const string Default = GroupName + ".AdministrativeUnitType";
            public const string Create = Default + ".Create";
            public const string Update = Default + ".Update";
            public const string Delete = Default + ".Delete";
        }
         

        public static class ServiceType
        {
            public const string Default = GroupName + ".ServiceType";
            public const string Create = Default + ".Create";
            public const string Update = Default + ".Update";
            public const string Delete = Default + ".Delete";
        }



        public static class TariffType
        {
            public const string Default = GroupName + ".TariffType";
            public const string Create = Default + ".Create";
            public const string Update = Default + ".Update";
            public const string Delete = Default + ".Delete";
        }



        public static class Bank
        {
            public const string Default = GroupName + ".Bank";
            public const string Create = Default + ".Create";
            public const string Update = Default + ".Update";
            public const string Delete = Default + ".Delete";
        }


        public static class Level
        {
            public const string Default = GroupName + ".Level";
            public const string Create = Default + ".Create";
            public const string Update = Default + ".Update";
            public const string Delete = Default + ".Delete";
        }


        public static class Currency
        {
            public const string Default = GroupName + ".Currency";
            public const string Create = Default + ".Create";
            public const string Update = Default + ".Update";
            public const string Delete = Default + ".Delete";
        }



        public static class PaymentType
        {
            public const string Default = GroupName + ".PaymentType";
            public const string Create = Default + ".Create";
            public const string Update = Default + ".Update";
            public const string Delete = Default + ".Delete";
        }


        public static class Position
        {
            public const string Default = GroupName + ".Position";
            public const string Create = Default + ".Create";
            public const string Update = Default + ".Update";
            public const string Delete = Default + ".Delete";
        }



        public static class AdministrativeUnit
        {
            public const string Default = GroupName + ".AdministrativeUnit";
            public const string Create = Default + ".Create";
            public const string Update = Default + ".Update";
            public const string Delete = Default + ".Delete";
        }

        public static class SignatarioConfiguracion
        {
            public const string Default = GroupName + ".SignatarioConfiguracion";
            public const string Delete = Default + ".Delete";
        }


        public static class Service
        {
            public const string Default = GroupName + ".Service";
            public const string Create = Default + ".Create";
            public const string Update = Default + ".Update";
            public const string Delete = Default + ".Delete";
        }


        public static class AgentAttention
        {
            public const string Default = GroupName + ".AgentAttention";
            public const string Create = Default + ".Create";
            public const string Update = Default + ".Update";
            public const string Delete = Default + ".Delete";
        }


        public static class Book
        {
            public const string Default = GroupName + ".Book";
            public const string Create = Default + ".Create";
            public const string Update = Default + ".Update";
            public const string Delete = Default + ".Delete";
        }


        public static class Tariff
        {
            public const string Default = GroupName + ".Tariff";
            public const string Create = Default + ".Create";
            public const string Update = Default + ".Update";
            public const string Delete = Default + ".Delete";
        }


        public static class TariffHierarchy
        {
            public const string Default = GroupName + ".TariffHierarchy";
            public const string Create = Default + ".Create";
            public const string Update = Default + ".Update";
            public const string Delete = Default + ".Delete";
        }


        public static class TariffHeading
        {
            public const string Default = GroupName + ".TariffHeading";
            public const string Create = Default + ".Create";
            public const string Update = Default + ".Update";
            public const string Delete = Default + ".Delete";
        }


        public static class Agreement
        {
            public const string Default = GroupName + ".Agreement";
            public const string Create = Default + ".Create";
            public const string Update = Default + ".Update";
            public const string Delete = Default + ".Delete";
        }


        public static class TipoCuentaBancaria
        {
            public const string Default = GroupName + ".TipoCuentaBancaria";
            public const string Create = Default + ".Create";
            public const string Update = Default + ".Update";
            public const string Delete = Default + ".Delete";
        }


        public static string[] GetAll()
        {
            return ReflectionHelper.GetPublicConstantsRecursively(typeof(AdministrativeUnitPermissions));
        }
    }
}