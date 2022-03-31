using System;
using Microsoft.EntityFrameworkCore;
using Mre.Sb.UnidadAdministrativa;
using Mre.Sb.UnidadAdministrativa.Dominio;
using Volo.Abp;
using Volo.Abp.EntityFrameworkCore.Modeling;

namespace Mre.Sb.AdministrativeUnit.EntityFrameworkCore
{
    public static class AdministrativeUnitDbContextModelCreatingExtensions
    {
        public static void ConfigureAdministrativeUnit(
            this ModelBuilder builder,
            Action<AdministrativeUnitModelBuilderConfigurationOptions> optionsAction = null)
        {
            Check.NotNull(builder, nameof(builder));

            var options = new AdministrativeUnitModelBuilderConfigurationOptions(
                UnidadAdministrativaDbProperties.DbTablePrefix,
                UnidadAdministrativaDbProperties.DbSchema
            );

            optionsAction?.Invoke(options);



            builder.Entity<TipoUnidadAdministrativa>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "TipoUnidadAdministrativa", options.Schema);

                b.ConfigureByConvention();
            });

            builder.Entity<UnidadAdministrativa.Dominio.UnidadAdministrativa>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "UnidadAdministrativa", options.Schema);

                b.ConfigureByConvention();

                b.HasOne(u => u.TipoUnidadAdministrativa).WithMany().HasForeignKey(a => a.TipoUnidadAdministrativaId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Restrict);

                b.HasOne(u => u.TipoCuentaBancaria).WithMany().HasForeignKey(a => a.TipoCuentaBancariaId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Restrict);

                b.HasMany(u => u.Servicios).WithOne().HasForeignKey(ur => ur.UnidadAdministrativaId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Restrict);

                b.HasMany(u => u.Funcionarios).WithOne().HasForeignKey(ur => ur.UnidadAdministrativaId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Restrict);

                b.HasMany(u => u.Signatarios).WithOne().HasForeignKey(ur => ur.UnidadAdministrativaId)
                   .IsRequired()
                   .OnDelete(DeleteBehavior.Restrict);

                b.HasMany(u => u.Jurisdiccion).WithOne().HasForeignKey(ur => ur.UnidadAdministrativaId)
                .IsRequired()
                .OnDelete(DeleteBehavior.Restrict);


                b.HasIndex(u => u.Siglas)
                 .IsUnique();

                b.HasIndex(u => u.Codigo)
                 .IsUnique();

            });



            builder.Entity<UnidadAdministrativaFuncionario>(b =>
            {
                b.ToTable(options.TablePrefix + "UnidadAdministrativaFuncionario", options.Schema);

                b.ConfigureByConvention();

                b.HasKey(af => new { af.UnidadAdministrativaId, af.UsuarioId });
                 

                b.HasOne(u => u.Cargo).WithMany().HasForeignKey(a => a.CargoId)
                 .IsRequired()
                 .OnDelete(DeleteBehavior.Restrict);

                b.HasIndex(af => new { af.UnidadAdministrativaId, af.UsuarioId });

                b.ApplyObjectExtensionMappings();
            });

            builder.Entity<Signatario>(b =>
            {
                b.ToTable(options.TablePrefix + "Signatario", options.Schema);

                b.ConfigureByConvention();

                b.HasKey(af => new { af.UnidadAdministrativaId, af.UsuarioId, af.ServicioId });

                b.HasIndex(af => new { af.UnidadAdministrativaId, af.UsuarioId, af.ServicioId });

                b.Property(af => af.PorDefecto).HasDefaultValue(false);

                b.ApplyObjectExtensionMappings();
            });

            builder.Entity<Jurisdiccion>(b =>
            {
                b.ToTable(options.TablePrefix + "Jurisdiccion", options.Schema);

                b.ConfigureByConvention();

                b.HasKey(af => new { af.UnidadAdministrativaId, af.Ciudad });

                b.ApplyObjectExtensionMappings();
            });



            builder.Entity<ConfiguracionSignatario>(b =>
            {
                b.ToTable(options.TablePrefix + "ConfiguracionSignatario", options.Schema);

                b.ConfigureByConvention();

                b.HasIndex(u => u.UsuarioId)
                .IsUnique();
                 

                b.HasIndex(af => new { af.UsuarioId });

                b.ApplyObjectExtensionMappings();
            });

            builder.Entity<UnidadAdministrativaServicio>(b =>
            {
                b.ToTable(options.TablePrefix + "UnidadAdministrativaServicio", options.Schema);

                b.ConfigureByConvention();

                b.HasKey(af => new { af.UnidadAdministrativaId, af.ServicioId });

                b.HasOne(u => u.TipoPago).WithMany().HasForeignKey(a => a.TipoPagoId)
                 .IsRequired()
                 .OnDelete(DeleteBehavior.Restrict);


                b.HasIndex(af => new { af.UnidadAdministrativaId, af.ServicioId });

                b.ApplyObjectExtensionMappings();
            });


            builder.Entity<Banco>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "Banco", options.Schema);

                b.ConfigureByConvention();
            });

            builder.Entity<TipoCuentaBancaria>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "TipoCuentaBancaria", options.Schema);

                b.ConfigureByConvention();
            });


            builder.Entity<TipoAtencion>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "TipoAtencion", options.Schema);

                b.ConfigureByConvention();
            });


            builder.Entity<Servicio>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "Servicio", options.Schema);

                b.ConfigureByConvention();

                b.HasOne(u => u.TipoServicio).WithMany().HasForeignKey(a => a.TipoServicioId)
                  .IsRequired()
                  .OnDelete(DeleteBehavior.Restrict);

            });


            builder.Entity<Ventanilla>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "Ventanilla", options.Schema);

                b.ConfigureByConvention();
            });


            builder.Entity<TipoPago>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "TipoPago", options.Schema);

                b.ConfigureByConvention();

                b.Property(x => x.Id).IsUnicode(false);

            });


            builder.Entity<Moneda>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "Moneda", options.Schema);

                b.ConfigureByConvention();
            });

            builder.Entity<Nivel>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "Nivel", options.Schema);

                b.ConfigureByConvention();
            });



            builder.Entity<TipoServicio>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "TipoServicio", options.Schema);

                b.ConfigureByConvention();

                b.Property(x => x.Id).IsUnicode(false);
            });


            builder.Entity<TipoArancel>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "TipoArancel", options.Schema);

                b.ConfigureByConvention();

                b.Property(x => x.Id).IsUnicode(false);
            });

            builder.Entity<Arancel>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "Arancel", options.Schema);

                b.ConfigureByConvention();

                b.HasOne(u => u.Moneda).WithMany().HasForeignKey(a => a.MonedaId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Restrict);

                b.HasMany(u => u.Jerarquias).WithOne().HasForeignKey(ur => ur.ArancelId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Cascade);
            });

            builder.Entity<JerarquiaArancelaria>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "JerarquiaArancelaria", options.Schema);

                b.ConfigureByConvention();

                b.HasOne(u => u.TipoArancel).WithMany().HasForeignKey(a => a.TipoArancelId)
                   .IsRequired()
                   .OnDelete(DeleteBehavior.Restrict);

                b.HasMany(u => u.Partidas).WithOne().HasForeignKey(ur => ur.JerarquiaArancelariaId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Cascade);

            });

            builder.Entity<PartidaArancelaria>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "PartidaArancelaria", options.Schema);

                b.ConfigureByConvention();

                b.HasMany(u => u.Servicios).WithOne().HasForeignKey(ur => ur.PartidaArancelariaId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Restrict);
            });

            builder.Entity<PartidaArancelariaServicio>(b =>
            {
                b.ToTable(options.TablePrefix + "PartidaArancelariaServicio", options.Schema);

                b.ConfigureByConvention();

                b.HasKey(af => new { af.PartidaArancelariaId, af.ServicioId});

                b.HasIndex(af => new { af.PartidaArancelariaId, af.ServicioId });

                b.ApplyObjectExtensionMappings();
            });

            builder.Entity<Libro>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "Libro", options.Schema);

                b.ConfigureByConvention();

                b.Property(x => x.Id).IsUnicode(false);
            });

            builder.Entity<SecuencialLibro>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "SecuencialLibro", options.Schema);

                b.ConfigureByConvention();

            });

            builder.Entity<TipoExoneracion>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "TipoExoneracion", options.Schema);

                b.ConfigureByConvention();

                b.Property(x => x.Id).IsUnicode(false);
            });

            builder.Entity<EntidadAuspiciante>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "EntidadAuspiciante", options.Schema);

                b.ConfigureByConvention();

                b.Property(x => x.Id).IsUnicode(false);
            });

            builder.Entity<Exoneracion>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "Exoneracion", options.Schema);

                b.ConfigureByConvention();

                b.HasOne(u => u.TipoExoneracion).WithMany().HasForeignKey(a => a.TipoExoneracionId)
                   .IsRequired()
                   .OnDelete(DeleteBehavior.Restrict);

                b.HasOne(u => u.EntidadAuspiciante).WithMany().HasForeignKey(a => a.EntidadAuspicianteId)
                   .OnDelete(DeleteBehavior.Restrict);

                b.HasKey(af => new { af.ConvenioId, af.ServicioId });

                b.HasOne<Servicio>().WithMany().HasForeignKey(ur => ur.ServicioId)
                   .IsRequired()
                   .OnDelete(DeleteBehavior.Restrict);

                b.HasIndex(af => new { af.ConvenioId, af.ServicioId });

                b.ApplyObjectExtensionMappings();

            });

            builder.Entity<Convenio>(b =>
            {
                //Configure table & schema name
                b.ToTable(options.TablePrefix + "Convenio", options.Schema);

                b.ConfigureByConvention();

                b.HasMany(u => u.Exoneraciones).WithOne().HasForeignKey(ur => ur.ConvenioId)
                   .IsRequired()
                   .OnDelete(DeleteBehavior.Restrict);
            });

        }
    }
}