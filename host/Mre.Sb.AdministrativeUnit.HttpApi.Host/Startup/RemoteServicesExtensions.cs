using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Mre.Sb.AdministrativeUnit.HttpApiClient.Tramite;
using Serilog.Context;
using Serilog.Core;
using Serilog.Core.Enrichers;
using Serilog.Events;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.AspNetCore.Serilog;
using Volo.Abp.Clients;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Modularity;
using Volo.Abp.MultiTenancy;
using Volo.Abp.Tracing;
using Volo.Abp.Users;

namespace Mre.Sb.AdministrativeUnit
{
    public static class RemoteServicesExtensions
    {

        public static void ConfigureHttpClient(
            ServiceConfigurationContext context,
            IConfiguration configuration,
            IWebHostEnvironment hostingEnvironment)
        {
             
            //1. Opcion, con proxy dinamicos creados con Abp
            //context.Services.AddHttpClientProxy(
            //  typeof(IServiceTrakingAppService),
            //  "ServiceTraking"
            //);


            //2. Cliente creados con nswag
            var urlTramite = configuration["RemoteServices:Tramite:BaseUrl"];

            context.Services.AddHttpClient<ITramiteClient, TramiteClient>(
                c =>
                {
                    c.BaseAddress = new Uri(urlTramite); 
                })
              //.AddHttpMessageHandler<HttpClientAuthorizationDelegatingHandler>()
              //.AddDevspacesSupport()
              ;
        }

    }

   
}
