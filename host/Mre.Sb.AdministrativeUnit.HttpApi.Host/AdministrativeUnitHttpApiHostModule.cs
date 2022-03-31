using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Mre.Sb.AdministrativeUnit.EntityFrameworkCore;
using Mre.Sb.AdministrativeUnit.MultiTenancy;
using StackExchange.Redis;
using Microsoft.OpenApi.Models;
using Volo.Abp;
using Volo.Abp.AspNetCore.Mvc.UI.MultiTenancy;
using Volo.Abp.AspNetCore.Mvc.UI.Theme.Shared;
using Volo.Abp.AspNetCore.Serilog;
using Volo.Abp.Autofac;
using Volo.Abp.Caching;
using Volo.Abp.Caching.StackExchangeRedis;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore.SqlServer;
using Volo.Abp.Localization;
using Volo.Abp.Modularity;
using Volo.Abp.MultiTenancy;
using Volo.Abp.PermissionManagement.EntityFrameworkCore;
using Volo.Abp.Swashbuckle;
using Volo.Abp.VirtualFileSystem;
using Volo.Abp.Http.Client.IdentityModel;
using Volo.Abp.EventBus;
using Volo.Abp.EventBus.Kafka;
using Mre.Sb.Auditar;
using Volo.Abp.Auditing;
using Mre.Sb.PermisoRemoto.Abp;
using Mre.Sb.UnidadAdministrativa;

namespace Mre.Sb.AdministrativeUnit
{
    [DependsOn(
        typeof(AdministrativeUnitApplicationModule),
        typeof(AdministrativeUnitEntityFrameworkCoreModule),
        typeof(AdministrativeUnitHttpApiModule),
        typeof(AbpAspNetCoreMvcUiMultiTenancyModule),
        typeof(AbpAutofacModule),
        typeof(AbpCachingStackExchangeRedisModule),
        typeof(AbpEntityFrameworkCoreSqlServerModule),
        typeof(AbpPermissionManagementEntityFrameworkCoreModule),
        //typeof(AbpSettingManagementEntityFrameworkCoreModule),
        typeof(AbpAspNetCoreSerilogModule),
        typeof(AbpSwashbuckleModule)
        )]
    [DependsOn(typeof(AbpEventBusKafkaModule))]
    [DependsOn(
        typeof(AbpHttpClientIdentityModelModule)
        )]
    [DependsOn(
        typeof(PermisoRemotoAbpModule)
        )]
    public class AdministrativeUnitHttpApiHostModule : AbpModule
    {

        public override void PreConfigureServices(ServiceConfigurationContext context)
        {
            var configuration = context.Services.GetConfiguration();

            PreConfigure<AbpEventBusOptions>(options =>
            {
                options.EnabledErrorHandle = true;
                options.UseRetryStrategy(retryStrategyOptions =>
                {
                    retryStrategyOptions.IntervalMillisecond = configuration.GetValue<int>("EventosDistribuidos:IntervaloTiempo");
                    retryStrategyOptions.MaxRetryAttempts = configuration.GetValue<int>("EventosDistribuidos:NumeroReintentos");
                });
            });
        }

        public override void ConfigureServices(ServiceConfigurationContext context)
        {
            var hostingEnvironment = context.Services.GetHostingEnvironment();
            var configuration = context.Services.GetConfiguration();

            ConfigureSiteCookiePolicy(context, configuration);


            Configure<AbpDbContextOptions>(options =>
            {
                options.UseSqlServer();
            });

            Configure<AbpMultiTenancyOptions>(options =>
            {
                options.IsEnabled = MultiTenancyConsts.IsEnabled;
            });

            if (hostingEnvironment.IsDevelopment())
            {
                Configure<AbpVirtualFileSystemOptions>(options =>
                {
                    //options.FileSets.ReplaceEmbeddedByPhysical<AdministrativeUnitDomainSharedModule>(Path.Combine(hostingEnvironment.ContentRootPath, string.Format("..{0}..{0}src{0}Mre.Sb.AdministrativeUnit.Domain.Shared", Path.DirectorySeparatorChar)));
                    //options.FileSets.ReplaceEmbeddedByPhysical<AdministrativeUnitDomainModule>(Path.Combine(hostingEnvironment.ContentRootPath, string.Format("..{0}..{0}src{0}Mre.Sb.AdministrativeUnit.Domain", Path.DirectorySeparatorChar)));
                    //options.FileSets.ReplaceEmbeddedByPhysical<AdministrativeUnitApplicationContractsModule>(Path.Combine(hostingEnvironment.ContentRootPath, string.Format("..{0}..{0}src{0}Mre.Sb.AdministrativeUnit.Application.Contracts", Path.DirectorySeparatorChar)));
                    //options.FileSets.ReplaceEmbeddedByPhysical<AdministrativeUnitApplicationModule>(Path.Combine(hostingEnvironment.ContentRootPath, string.Format("..{0}..{0}src{0}Mre.Sb.AdministrativeUnit.Application", Path.DirectorySeparatorChar)));
                });
            }

            
            context.Services.AddAbpSwaggerGenWithOAuth(
                configuration["AuthServer:Authority"],
                new Dictionary<string, string>
                {
                    {"UnidadAdministrativa", "UnidadAdministrativa API"},
                    {"Base", "Base API"}
                },
                options =>
                {
                    options.SwaggerDoc("v1", new OpenApiInfo {Title = "Unidades Administrativas API", Version = "v1"});
                    options.DocInclusionPredicate((docName, description) => true);
                    options.CustomSchemaIds(type => type.FullName);
                });

            Configure<AbpLocalizationOptions>(options =>
            {
                //options.Languages.Add(new LanguageInfo("en", "en", "English"));
                options.Languages.Add(new LanguageInfo("es", "es", "Español", "es"));
            });

            context.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options =>
                {
                    options.Authority = configuration["AuthServer:Authority"];
                    options.RequireHttpsMetadata = Convert.ToBoolean(configuration["AuthServer:RequireHttpsMetadata"]);
                    options.Audience = configuration["AuthServer:Audience"];

                    //TODO.. 
                    //options.MapInboundClaims = false;
                });

            Configure<AbpDistributedCacheOptions>(options =>
            {
                options.KeyPrefix = configuration["Cache:KeyPrefix"];
            });

            if (!hostingEnvironment.IsDevelopment())
            {
                var redis = ConnectionMultiplexer.Connect(configuration["Redis:Configuration"]);
                context.Services
                    .AddDataProtection()
                    .PersistKeysToStackExchangeRedis(redis, "AdministrativeUnit-Protection-Keys");
            }

            context.Services.AddCors(options =>
            {
                options.AddDefaultPolicy(builder =>
                {
                    builder
                        .WithOrigins(
                            configuration["App:CorsOrigins"]
                                .Split(",", StringSplitOptions.RemoveEmptyEntries)
                                .Select(o => o.RemovePostFix("/"))
                                .ToArray()
                        )
                        .WithAbpExposedHeaders()
                        .SetIsOriginAllowedToAllowWildcardSubdomains()
                        .AllowAnyHeader()
                        .AllowAnyMethod()
                        .AllowCredentials();
                });
            });

            //Configure<AbpAspNetCoreMvcOptions>(options =>
            //{
            //    options
            //        .ConventionalControllers
            //        .Create(typeof(AdministrativeUnitApplicationModule).Assembly);
            //});

            RemoteServicesExtensions.ConfigureHttpClient(context, configuration, hostingEnvironment);

            Configure<AbpAuditingOptions>(options =>
            {
                options.IsEnabled = false; //Desactivar auditoria abp
            });

           
            context.Services.AgregarAuditoria(configuration);
        }


        private void ConfigureSiteCookiePolicy(ServiceConfigurationContext context, IConfiguration configuration)
        {

            context.Services.AddSameSiteCookiePolicy();
        }


        public override void OnApplicationInitialization(ApplicationInitializationContext context)
        {
            var app = context.GetApplicationBuilder();
            var env = context.GetEnvironment();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseErrorPage();
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseCorrelationId();
            app.UseStaticFiles();
            app.UseRouting();
            app.UseCors();

            app.UseCookiePolicy();


            app.UseAuthentication();
            if (MultiTenancyConsts.IsEnabled)
            {
                app.UseMultiTenancy();
            }
            app.UseAbpRequestLocalization();
            app.UseAuthorization();
            app.UseSwagger();
            app.UseAbpSwaggerUI(options =>
            {
                options.SwaggerEndpoint("/swagger/v1/swagger.json", "Support APP API");

                var configuration = context.GetConfiguration();
                options.OAuthClientId(configuration["AuthServer:SwaggerClientId"]);
                options.OAuthClientSecret(configuration["AuthServer:SwaggerClientSecret"]);
                options.OAuthScopes("UnidadAdministrativa", "Base");
            });
            
            app.UseAbpSerilogEnrichers();

            app.UseConfiguredEndpoints();

            
            app.UsarAuditoria<UnidadAdministrativaDbContext>();


        }



    }
}
