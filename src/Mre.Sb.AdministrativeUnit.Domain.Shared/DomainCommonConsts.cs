namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    /// <summary>
    /// Constantes comunes para todas las entidades
    /// </summary>
    public static class DomainCommonConsts
    {
        /// <summary>
        /// Maximum length of the <see cref="Id"/> property.
        /// </summary>
        public const int MaxIdLength = 8;

        /// <summary>
        /// Maximum length of the <see cref="Name"/> property.
        /// </summary>
        public const int MaxNameLength = 80;

        /// <summary>
        /// Maximum length of the <see cref="Description"/> property.
        /// </summary>
        public const int MaxDescriptionLength = 256;

        /// <summary>
        /// Maximum length of the <see cref="Address"/> property.
        /// </summary>
        public const int MaxAddressLength = 512;

        /// <summary>
        /// Maximum length of the <see cref="GeographicalIdLength"/> property.
        /// </summary>
        public const int MaxGeographicalIdLength = 12;

        
        public static class ExpressionRegular {


            public const string Alfanumericos = @"^\w+$";

            public const string AlfanumericosGuionesPuntoEspacio = @"^[a-zA-Z0-9-_\s.áéíóúÁÉÍÓÚñÑ]+$";

           
        }

    }
}
