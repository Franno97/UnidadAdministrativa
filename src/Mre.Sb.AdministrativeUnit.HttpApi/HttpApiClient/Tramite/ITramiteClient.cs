using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mre.Sb.AdministrativeUnit.HttpApiClient.Tramite
{
    [System.CodeDom.Compiler.GeneratedCode("NSwag", "13.15.7.0 (NJsonSchema v10.6.7.0 (Newtonsoft.Json v12.0.0.0))")]
    public partial interface ITramiteClient
    {
       
        /// <returns>Success</returns>
        /// <exception cref="ApiException">A server side error occurred.</exception>
        System.Threading.Tasks.Task<ExistenTramitesResponse> ExistenTramitesPorServicioAsync(System.Guid? servicioId);

        /// <param name="cancellationToken">A cancellation token that can be used by other objects or threads to receive notice of cancellation.</param>
        /// <returns>Success</returns>
        /// <exception cref="ApiException">A server side error occurred.</exception>
        System.Threading.Tasks.Task<ExistenTramitesResponse> ExistenTramitesPorServicioAsync(System.Guid? servicioId, System.Threading.CancellationToken cancellationToken);

        /// <returns>Success</returns>
        /// <exception cref="ApiException">A server side error occurred.</exception>
        System.Threading.Tasks.Task<ExistenTramitesResponse> ExistenTramitesPorUnidadAdministrativaAsync(System.Guid? unidadAdministrativaId);

        /// <param name="cancellationToken">A cancellation token that can be used by other objects or threads to receive notice of cancellation.</param>
        /// <returns>Success</returns>
        /// <exception cref="ApiException">A server side error occurred.</exception>
        System.Threading.Tasks.Task<ExistenTramitesResponse> ExistenTramitesPorUnidadAdministrativaAsync(System.Guid? unidadAdministrativaId, System.Threading.CancellationToken cancellationToken);

        /// <returns>Success</returns>
        /// <exception cref="ApiException">A server side error occurred.</exception>
        System.Threading.Tasks.Task<ExistenTramitesResponse> ExistenTramitesPorFuncionarioAsync(System.Guid? funcionarioId);

        /// <param name="cancellationToken">A cancellation token that can be used by other objects or threads to receive notice of cancellation.</param>
        /// <returns>Success</returns>
        /// <exception cref="ApiException">A server side error occurred.</exception>
        System.Threading.Tasks.Task<ExistenTramitesResponse> ExistenTramitesPorFuncionarioAsync(System.Guid? funcionarioId, System.Threading.CancellationToken cancellationToken);

    }

    [System.CodeDom.Compiler.GeneratedCode("NJsonSchema", "13.15.7.0 (NJsonSchema v10.6.7.0 (Newtonsoft.Json v12.0.0.0))")]
    public partial class ExistenTramitesResponse
    {

        [System.Text.Json.Serialization.JsonPropertyName("activo")]
        public bool Activo { get; set; }

        [System.Text.Json.Serialization.JsonPropertyName("cuenta")]
        public int Cuenta { get; set; }

    }
}
