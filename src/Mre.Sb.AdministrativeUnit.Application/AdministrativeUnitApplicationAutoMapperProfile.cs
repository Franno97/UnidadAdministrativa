using AutoMapper;
using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.Geographical;
using Volo.Abp.AutoMapper;
using Mre.Sb.UnidadAdministrativa.UnidadAdministrativa;
using Mre.Sb.UnidadAdministrativa.Servicio;
using Mre.Sb.UnidadAdministrativa.Geografica;
using Mre.Sb.UnidadAdministrativa.Ventanilla;

namespace Mre.Sb.UnidadAdministrativa
{
    public class AdministrativeUnitApplicationAutoMapperProfile : Profile
    {
        public AdministrativeUnitApplicationAutoMapperProfile()
        {
            CreateMap<TipoUnidadAdministrativa, UnidadAdministrativaTipoDto>()
                 .ForMember(x => x.Nombre, map => map.MapFrom(src => src.Nombre))
                ;
            CreateMap<TipoUnidadAdministrativa, UnidadAdministrativaTipoInfoDto>()
                .ForMember(x => x.Nombre, map => map.MapFrom(src => src.Nombre))
                ;
            CreateMap<UnidadAdministrativaTipoDto, TipoUnidadAdministrativa>()
                .ForMember(x => x.Nombre, map => map.MapFrom(src => src.Nombre));

            //CreateMap<UnidadAdministrativa, AdministrativeUnitDto>();
            //CreateMap<CrearActualizarUnidadAdministrativaDto, UnidadAdministrativa>();


            CreateMap<Nivel, NivelDto>();
            CreateMap<Nivel, NivelLookupDto>();

            CreateMap<NivelDto, Nivel>();


            CreateMap<Moneda, MonedaDto>();
            CreateMap<Moneda, MonedaLookupDto>();
            CreateMap<MonedaDto, Moneda>();



            CreateMap<Banco, BancoDto>();
            CreateMap<Banco, BancoLookupDto>();
            CreateMap<BancoDto, Banco>();



            CreateMap<TipoServicio, TipoServicioDto>();
            CreateMap<TipoServicio, TipoServicioLookupDto>();
            CreateMap<TipoServicioDto, TipoServicio>();


            CreateMap<TipoPago, TipoPagoDto>();
            CreateMap<TipoPagoDto, TipoPago>();


            //CreateMap<Domain.Servicio, ServiceDto>();

            //CreateMap<ServiceDto, Domain.Servicio>();

            CreateMap<TipoArancel, TipoArancelDto>();
            CreateMap<TipoArancel, TipoArancelLookupDto>();
            CreateMap<TipoArancelDto, TipoArancel>();



            CreateMap<Cargo, CargoDto>();
            CreateMap<Cargo, CargoLookupDto>();
            CreateMap<CargoDto, Cargo>();

            CreateMap<Region, RegionDto>();
            CreateMap<Country, CountryDto>();

            CreateMap<CrearActualizarServicioDto, Dominio.Servicio>()
                .ForMember(x => x.Id, map => map.Ignore())
                .ForMember(x => x.ConcurrencyStamp, map => map.Ignore())
                .ForMember(x => x.ExtraProperties, map => map.Ignore())
                .ForMember(x => x.TipoServicio, map => map.Ignore())
                .IgnoreAuditedObjectProperties();

            //CreateMap<Dominio.UnidadAdministrativa, UnidadAdministrativaInfoDto>()
            //    .ForMember(x => x.Siglas, map => map.MapFrom(src => src.Siglas))
            //    .ForMember(x => x.Nombre, map => map.MapFrom(src => src.Nombre))
            //    .ForMember(x => x.PaisId, map => map.MapFrom(src => src.PaisId));

            CreateMap<CrearActualizarUnidadAdministrativaDto, Dominio.UnidadAdministrativa>()
                .ForMember(x => x.Id, map => map.Ignore())
                .ForMember(x => x.ConcurrencyStamp, map => map.Ignore())
                .ForMember(x => x.ExtraProperties, map => map.Ignore())
                .ForMember(x => x.DependenciaAdministrativa, map => map.Ignore())
                .ForMember(x => x.TipoUnidadAdministrativa, map => map.Ignore())
                .ForMember(x => x.Banco, map => map.Ignore())
                .ForMember(x => x.TipoCuentaBancaria, map => map.Ignore())
                .ForMember(x => x.Moneda, map => map.Ignore())
                .ForMember(x => x.Nivel, map => map.Ignore())
                .ForMember(x => x.JefeMisionId, map => map.Ignore())
                .ForMember(x => x.Signatarios, map => map.Ignore())
                .ForMember(x => x.Funcionarios, map => map.Ignore())
                .ForMember(x => x.Servicios, map => map.Ignore())
                .ForMember(x => x.IsDeleted, map => map.Ignore())
                .ForMember(x => x.DeleterId, map => map.Ignore())
                .ForMember(x => x.DeletionTime, map => map.Ignore())
                .ForMember(x => x.Jurisdiccion, map => map.Ignore())
                .IgnoreAuditedObjectProperties();

            CreateMap<CrearActualizarVentanillaDto, Dominio.Ventanilla>()
                .ForMember(x => x.Id, map => map.Ignore())
                .ForMember(x => x.ConcurrencyStamp, map => map.Ignore())
                .ForMember(x => x.ExtraProperties, map => map.Ignore())
                .IgnoreAuditedObjectProperties();

            CreateMap<CrearActualizarSecuencialLibroDto, SecuencialLibro>()
                .ForMember(x => x.Id, map => map.Ignore())
                .ForMember(x => x.Libro, map => map.Ignore())
                .ForMember(x => x.ConcurrencyStamp, map => map.Ignore())
                .ForMember(x => x.ExtraProperties, map => map.Ignore())
                .IgnoreAuditedObjectProperties();
            //CreateMap<SecuencialLibro, SequentialBookDto>();

            CreateMap<Libro, LibroDto>();
            CreateMap<Libro, LibroLookupDto>();
            CreateMap<LibroDto, Libro>();

            CreateMap<Arancel, ArancelDto>();
            CreateMap<Arancel, ArancelLookupDto>();
            CreateMap<CrearActualizarArancelDto, Arancel>()
            .ForMember(x => x.Id, map => map.Ignore())
            .ForMember(x => x.Moneda, map => map.Ignore())
            .ForMember(x => x.Jerarquias, map => map.Ignore())
            .ForMember(x => x.ConcurrencyStamp, map => map.Ignore())
            .ForMember(x => x.ExtraProperties, map => map.Ignore())
            .IgnoreAuditedObjectProperties();

            CreateMap<JerarquiaArancelaria, JerarquiaArancelariaDto>();
            CreateMap<JerarquiaArancelaria, JerarquiaArancelariaLookupDto>();
            CreateMap<CrearActualizarJerarquiaArancelariaDto, JerarquiaArancelaria>()
            .ForMember(x => x.Id, map => map.Ignore())
            .ForMember(x => x.TipoArancel, map => map.Ignore())
            .ForMember(x => x.Partidas, map => map.Ignore())
            .ForMember(x => x.ConcurrencyStamp, map => map.Ignore())
            .ForMember(x => x.ExtraProperties, map => map.Ignore())
            .IgnoreAuditedObjectProperties();

            CreateMap<PartidaArancelaria, PartidaArancelariaDto>();
            CreateMap<PartidaArancelaria, PartidaArancelariaLookupDto>();
            CreateMap<CrearActualizarPartidaArancelariaDto, PartidaArancelaria>()
            .ForMember(x => x.Id, map => map.Ignore())
            .ForMember(x => x.ConcurrencyStamp, map => map.Ignore())
            .ForMember(x => x.ExtraProperties, map => map.Ignore())
            .ForMember(x => x.Servicios, map => map.Ignore())
            .IgnoreAuditedObjectProperties();

            CreateMap<Convenio, ConvenioDto>();
            CreateMap<Convenio, ConvenioLookupDto>();
            CreateMap<CrearActualizarConvenioDto, Convenio>()
            .ForMember(x => x.Id, map => map.Ignore())
            .ForMember(x => x.Exoneraciones, map => map.Ignore())
            .ForMember(x => x.ConcurrencyStamp, map => map.Ignore())
            .ForMember(x => x.ExtraProperties, map => map.Ignore())
            .IgnoreAuditedObjectProperties();

            CreateMap<TipoExoneracion, TipoExoneracionDto>();
            CreateMap<TipoExoneracion, TipoExoneracionLookupDto>();
            CreateMap<TipoExoneracionDto, TipoExoneracion>();

            CreateMap<EntidadAuspiciante, EntidadAuspicianteDto>();
            CreateMap<EntidadAuspiciante, EntidadAuspicianteLookupDto>();
            CreateMap<EntidadAuspicianteDto, EntidadAuspiciante>();


            CreateMap<ConfiguracionSignatarioDto, ConfiguracionSignatario>()
                .IgnoreAuditedObjectProperties();


            CreateMap<TipoCuentaBancaria, TipoCuentaBancariaDto>();
            CreateMap<TipoCuentaBancariaDto, TipoCuentaBancaria>();


        }
    }
}