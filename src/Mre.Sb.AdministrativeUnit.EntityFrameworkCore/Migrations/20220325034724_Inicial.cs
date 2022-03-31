using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Mre.Sb.AdministrativeUnit.Migrations
{
    public partial class Inicial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Banco",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(4)", maxLength: 4, nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Banco", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Cargo",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(8)", maxLength: 8, nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Cargo", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "ConfiguracionSignatario",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UsuarioId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    NombreArchivo = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    TipoContenido = table.Column<string>(type: "nvarchar(32)", maxLength: 32, nullable: true),
                    Extension = table.Column<string>(type: "nvarchar(3)", maxLength: 3, nullable: true),
                    Data = table.Column<byte[]>(type: "varbinary(max)", nullable: false),
                    Clave = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatorId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    LastModificationTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    LastModifierId = table.Column<Guid>(type: "uniqueidentifier", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ConfiguracionSignatario", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Convenio",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Descripcion = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false),
                    FechaCreacion = table.Column<DateTime>(type: "datetime2", nullable: false),
                    FechaExpiracion = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ExtraProperties = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(40)", maxLength: 40, nullable: true),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatorId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    LastModificationTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    LastModifierId = table.Column<Guid>(type: "uniqueidentifier", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Convenio", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "EntidadAuspiciante",
                columns: table => new
                {
                    Id = table.Column<string>(type: "varchar(4)", unicode: false, maxLength: 4, nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EntidadAuspiciante", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Libro",
                columns: table => new
                {
                    Id = table.Column<string>(type: "varchar(4)", unicode: false, maxLength: 4, nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Libro", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Moneda",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(4)", maxLength: 4, nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: false),
                    Simbolo = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Moneda", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Nivel",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(4)", maxLength: 4, nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Nivel", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "TipoArancel",
                columns: table => new
                {
                    Id = table.Column<string>(type: "varchar(4)", unicode: false, maxLength: 4, nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TipoArancel", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "TipoAtencion",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(8)", maxLength: 8, nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TipoAtencion", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "TipoCuentaBancaria",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(4)", maxLength: 4, nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TipoCuentaBancaria", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "TipoExoneracion",
                columns: table => new
                {
                    Id = table.Column<string>(type: "varchar(4)", unicode: false, maxLength: 4, nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TipoExoneracion", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "TipoPago",
                columns: table => new
                {
                    Id = table.Column<string>(type: "varchar(8)", unicode: false, maxLength: 8, nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TipoPago", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "TipoServicio",
                columns: table => new
                {
                    Id = table.Column<string>(type: "varchar(8)", unicode: false, maxLength: 8, nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TipoServicio", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "TipoUnidadAdministrativa",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(4)", maxLength: 4, nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TipoUnidadAdministrativa", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Ventanilla",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UnidadAdministrativaId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: false),
                    AtencionPresencial = table.Column<bool>(type: "bit", nullable: false),
                    AtencionVirtual = table.Column<bool>(type: "bit", nullable: false),
                    InicioAtencion = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FinAtencion = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Activo = table.Column<bool>(type: "bit", nullable: false),
                    ExtraProperties = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(40)", maxLength: 40, nullable: true),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatorId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    LastModificationTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    LastModifierId = table.Column<Guid>(type: "uniqueidentifier", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Ventanilla", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SecuencialLibro",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ServicioId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UnidadAdministrativaId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    LibroId = table.Column<string>(type: "varchar(4)", nullable: false),
                    NumeroPaginaPorVolumen = table.Column<int>(type: "int", nullable: false),
                    VolumenActual = table.Column<int>(type: "int", nullable: false),
                    SiguientePagina = table.Column<int>(type: "int", nullable: false),
                    Anio = table.Column<int>(type: "int", nullable: false),
                    ExtraProperties = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(40)", maxLength: 40, nullable: true),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatorId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    LastModificationTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    LastModifierId = table.Column<Guid>(type: "uniqueidentifier", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SecuencialLibro", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SecuencialLibro_Libro_LibroId",
                        column: x => x.LibroId,
                        principalTable: "Libro",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Arancel",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Descripcion = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false),
                    MonedaId = table.Column<string>(type: "nvarchar(4)", nullable: false),
                    Activo = table.Column<bool>(type: "bit", nullable: false),
                    ExtraProperties = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(40)", maxLength: 40, nullable: true),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatorId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    LastModificationTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    LastModifierId = table.Column<Guid>(type: "uniqueidentifier", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Arancel", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Arancel_Moneda_MonedaId",
                        column: x => x.MonedaId,
                        principalTable: "Moneda",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Servicio",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: false),
                    AtencionPresencial = table.Column<bool>(type: "bit", nullable: false),
                    AtencionSemiPresencial = table.Column<bool>(type: "bit", nullable: false),
                    AtencionVirtual = table.Column<bool>(type: "bit", nullable: false),
                    TipoServicioId = table.Column<string>(type: "varchar(8)", nullable: false),
                    Activo = table.Column<bool>(type: "bit", nullable: false),
                    ExtraProperties = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(40)", maxLength: 40, nullable: true),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatorId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    LastModificationTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    LastModifierId = table.Column<Guid>(type: "uniqueidentifier", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Servicio", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Servicio_TipoServicio_TipoServicioId",
                        column: x => x.TipoServicioId,
                        principalTable: "TipoServicio",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "UnidadAdministrativa",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    TipoUnidadAdministrativaId = table.Column<string>(type: "nvarchar(4)", nullable: false),
                    DependenciaAdministrativaId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    Codigo = table.Column<string>(type: "nvarchar(4)", maxLength: 4, nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: false),
                    Siglas = table.Column<string>(type: "nvarchar(4)", maxLength: 4, nullable: false),
                    PaisId = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    RegionId = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Ciudad = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Direccion = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CodigoPostal = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    BancoId = table.Column<string>(type: "nvarchar(4)", nullable: false),
                    NumeroCuentaBancaria = table.Column<string>(type: "nvarchar(32)", maxLength: 32, nullable: false),
                    TipoCuentaBancariaId = table.Column<string>(type: "nvarchar(4)", nullable: false),
                    TitularCuentaBancaria = table.Column<string>(type: "nvarchar(80)", maxLength: 80, nullable: false),
                    MonedaId = table.Column<string>(type: "nvarchar(4)", nullable: false),
                    FechaInicioOperacion = table.Column<DateTime>(type: "datetime2", nullable: true),
                    FechaFinOperacion = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Activo = table.Column<bool>(type: "bit", nullable: false),
                    NivelId = table.Column<string>(type: "nvarchar(4)", nullable: true),
                    Observaciones = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    JefeMisionId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    ExtraProperties = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(40)", maxLength: 40, nullable: true),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatorId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    LastModificationTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    LastModifierId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    DeleterId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    DeletionTime = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UnidadAdministrativa", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UnidadAdministrativa_Banco_BancoId",
                        column: x => x.BancoId,
                        principalTable: "Banco",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UnidadAdministrativa_Moneda_MonedaId",
                        column: x => x.MonedaId,
                        principalTable: "Moneda",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UnidadAdministrativa_Nivel_NivelId",
                        column: x => x.NivelId,
                        principalTable: "Nivel",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_UnidadAdministrativa_TipoCuentaBancaria_TipoCuentaBancariaId",
                        column: x => x.TipoCuentaBancariaId,
                        principalTable: "TipoCuentaBancaria",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_UnidadAdministrativa_TipoUnidadAdministrativa_TipoUnidadAdministrativaId",
                        column: x => x.TipoUnidadAdministrativaId,
                        principalTable: "TipoUnidadAdministrativa",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_UnidadAdministrativa_UnidadAdministrativa_DependenciaAdministrativaId",
                        column: x => x.DependenciaAdministrativaId,
                        principalTable: "UnidadAdministrativa",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "JerarquiaArancelaria",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ArancelId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    TipoArancelId = table.Column<string>(type: "varchar(4)", nullable: false),
                    Descripcion = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false),
                    Orden = table.Column<int>(type: "int", nullable: false),
                    NumeroJerarquia = table.Column<int>(type: "int", nullable: false),
                    ExtraProperties = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(40)", maxLength: 40, nullable: true),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatorId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    LastModificationTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    LastModifierId = table.Column<Guid>(type: "uniqueidentifier", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_JerarquiaArancelaria", x => x.Id);
                    table.ForeignKey(
                        name: "FK_JerarquiaArancelaria_Arancel_ArancelId",
                        column: x => x.ArancelId,
                        principalTable: "Arancel",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_JerarquiaArancelaria_TipoArancel_TipoArancelId",
                        column: x => x.TipoArancelId,
                        principalTable: "TipoArancel",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Exoneracion",
                columns: table => new
                {
                    ConvenioId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ServicioId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Valor = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    PaisId = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    EdadInicial = table.Column<int>(type: "int", nullable: true),
                    EdadFinal = table.Column<int>(type: "int", nullable: true),
                    Discapacitado = table.Column<bool>(type: "bit", nullable: true),
                    TipoExoneracionId = table.Column<string>(type: "varchar(4)", nullable: false),
                    EntidadAuspicianteId = table.Column<string>(type: "varchar(4)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Exoneracion", x => new { x.ConvenioId, x.ServicioId });
                    table.ForeignKey(
                        name: "FK_Exoneracion_Convenio_ConvenioId",
                        column: x => x.ConvenioId,
                        principalTable: "Convenio",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Exoneracion_EntidadAuspiciante_EntidadAuspicianteId",
                        column: x => x.EntidadAuspicianteId,
                        principalTable: "EntidadAuspiciante",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Exoneracion_Servicio_ServicioId",
                        column: x => x.ServicioId,
                        principalTable: "Servicio",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Exoneracion_TipoExoneracion_TipoExoneracionId",
                        column: x => x.TipoExoneracionId,
                        principalTable: "TipoExoneracion",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Jurisdiccion",
                columns: table => new
                {
                    UnidadAdministrativaId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Ciudad = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Jurisdiccion", x => new { x.UnidadAdministrativaId, x.Ciudad });
                    table.ForeignKey(
                        name: "FK_Jurisdiccion_UnidadAdministrativa_UnidadAdministrativaId",
                        column: x => x.UnidadAdministrativaId,
                        principalTable: "UnidadAdministrativa",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Signatario",
                columns: table => new
                {
                    UnidadAdministrativaId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UsuarioId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ServicioId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    PorDefecto = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Signatario", x => new { x.UnidadAdministrativaId, x.UsuarioId, x.ServicioId });
                    table.ForeignKey(
                        name: "FK_Signatario_UnidadAdministrativa_UnidadAdministrativaId",
                        column: x => x.UnidadAdministrativaId,
                        principalTable: "UnidadAdministrativa",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "UnidadAdministrativaFuncionario",
                columns: table => new
                {
                    UnidadAdministrativaId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UsuarioId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CargoId = table.Column<string>(type: "nvarchar(8)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UnidadAdministrativaFuncionario", x => new { x.UnidadAdministrativaId, x.UsuarioId });
                    table.ForeignKey(
                        name: "FK_UnidadAdministrativaFuncionario_Cargo_CargoId",
                        column: x => x.CargoId,
                        principalTable: "Cargo",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_UnidadAdministrativaFuncionario_UnidadAdministrativa_UnidadAdministrativaId",
                        column: x => x.UnidadAdministrativaId,
                        principalTable: "UnidadAdministrativa",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "UnidadAdministrativaServicio",
                columns: table => new
                {
                    UnidadAdministrativaId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ServicioId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    TipoPagoId = table.Column<string>(type: "varchar(8)", nullable: false),
                    Activo = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UnidadAdministrativaServicio", x => new { x.UnidadAdministrativaId, x.ServicioId });
                    table.ForeignKey(
                        name: "FK_UnidadAdministrativaServicio_TipoPago_TipoPagoId",
                        column: x => x.TipoPagoId,
                        principalTable: "TipoPago",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_UnidadAdministrativaServicio_UnidadAdministrativa_UnidadAdministrativaId",
                        column: x => x.UnidadAdministrativaId,
                        principalTable: "UnidadAdministrativa",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PartidaArancelaria",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    JerarquiaArancelariaId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Descripcion = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false),
                    NumeroPartida = table.Column<string>(type: "nvarchar(4)", maxLength: 4, nullable: false),
                    Valor = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    ExtraProperties = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(40)", maxLength: 40, nullable: true),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatorId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    LastModificationTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    LastModifierId = table.Column<Guid>(type: "uniqueidentifier", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PartidaArancelaria", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PartidaArancelaria_JerarquiaArancelaria_JerarquiaArancelariaId",
                        column: x => x.JerarquiaArancelariaId,
                        principalTable: "JerarquiaArancelaria",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PartidaArancelariaServicio",
                columns: table => new
                {
                    PartidaArancelariaId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ServicioId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PartidaArancelariaServicio", x => new { x.PartidaArancelariaId, x.ServicioId });
                    table.ForeignKey(
                        name: "FK_PartidaArancelariaServicio_PartidaArancelaria_PartidaArancelariaId",
                        column: x => x.PartidaArancelariaId,
                        principalTable: "PartidaArancelaria",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Arancel_MonedaId",
                table: "Arancel",
                column: "MonedaId");

            migrationBuilder.CreateIndex(
                name: "IX_ConfiguracionSignatario_UsuarioId",
                table: "ConfiguracionSignatario",
                column: "UsuarioId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Exoneracion_ConvenioId_ServicioId",
                table: "Exoneracion",
                columns: new[] { "ConvenioId", "ServicioId" });

            migrationBuilder.CreateIndex(
                name: "IX_Exoneracion_EntidadAuspicianteId",
                table: "Exoneracion",
                column: "EntidadAuspicianteId");

            migrationBuilder.CreateIndex(
                name: "IX_Exoneracion_ServicioId",
                table: "Exoneracion",
                column: "ServicioId");

            migrationBuilder.CreateIndex(
                name: "IX_Exoneracion_TipoExoneracionId",
                table: "Exoneracion",
                column: "TipoExoneracionId");

            migrationBuilder.CreateIndex(
                name: "IX_JerarquiaArancelaria_ArancelId",
                table: "JerarquiaArancelaria",
                column: "ArancelId");

            migrationBuilder.CreateIndex(
                name: "IX_JerarquiaArancelaria_TipoArancelId",
                table: "JerarquiaArancelaria",
                column: "TipoArancelId");

            migrationBuilder.CreateIndex(
                name: "IX_PartidaArancelaria_JerarquiaArancelariaId",
                table: "PartidaArancelaria",
                column: "JerarquiaArancelariaId");

            migrationBuilder.CreateIndex(
                name: "IX_PartidaArancelariaServicio_PartidaArancelariaId_ServicioId",
                table: "PartidaArancelariaServicio",
                columns: new[] { "PartidaArancelariaId", "ServicioId" });

            migrationBuilder.CreateIndex(
                name: "IX_SecuencialLibro_LibroId",
                table: "SecuencialLibro",
                column: "LibroId");

            migrationBuilder.CreateIndex(
                name: "IX_Servicio_TipoServicioId",
                table: "Servicio",
                column: "TipoServicioId");

            migrationBuilder.CreateIndex(
                name: "IX_Signatario_UnidadAdministrativaId_UsuarioId_ServicioId",
                table: "Signatario",
                columns: new[] { "UnidadAdministrativaId", "UsuarioId", "ServicioId" });

            migrationBuilder.CreateIndex(
                name: "IX_UnidadAdministrativa_BancoId",
                table: "UnidadAdministrativa",
                column: "BancoId");

            migrationBuilder.CreateIndex(
                name: "IX_UnidadAdministrativa_Codigo",
                table: "UnidadAdministrativa",
                column: "Codigo",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_UnidadAdministrativa_DependenciaAdministrativaId",
                table: "UnidadAdministrativa",
                column: "DependenciaAdministrativaId");

            migrationBuilder.CreateIndex(
                name: "IX_UnidadAdministrativa_MonedaId",
                table: "UnidadAdministrativa",
                column: "MonedaId");

            migrationBuilder.CreateIndex(
                name: "IX_UnidadAdministrativa_NivelId",
                table: "UnidadAdministrativa",
                column: "NivelId");

            migrationBuilder.CreateIndex(
                name: "IX_UnidadAdministrativa_Siglas",
                table: "UnidadAdministrativa",
                column: "Siglas",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_UnidadAdministrativa_TipoCuentaBancariaId",
                table: "UnidadAdministrativa",
                column: "TipoCuentaBancariaId");

            migrationBuilder.CreateIndex(
                name: "IX_UnidadAdministrativa_TipoUnidadAdministrativaId",
                table: "UnidadAdministrativa",
                column: "TipoUnidadAdministrativaId");

            migrationBuilder.CreateIndex(
                name: "IX_UnidadAdministrativaFuncionario_CargoId",
                table: "UnidadAdministrativaFuncionario",
                column: "CargoId");

            migrationBuilder.CreateIndex(
                name: "IX_UnidadAdministrativaFuncionario_UnidadAdministrativaId_UsuarioId",
                table: "UnidadAdministrativaFuncionario",
                columns: new[] { "UnidadAdministrativaId", "UsuarioId" });

            migrationBuilder.CreateIndex(
                name: "IX_UnidadAdministrativaServicio_TipoPagoId",
                table: "UnidadAdministrativaServicio",
                column: "TipoPagoId");

            migrationBuilder.CreateIndex(
                name: "IX_UnidadAdministrativaServicio_UnidadAdministrativaId_ServicioId",
                table: "UnidadAdministrativaServicio",
                columns: new[] { "UnidadAdministrativaId", "ServicioId" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ConfiguracionSignatario");

            migrationBuilder.DropTable(
                name: "Exoneracion");

            migrationBuilder.DropTable(
                name: "Jurisdiccion");

            migrationBuilder.DropTable(
                name: "PartidaArancelariaServicio");

            migrationBuilder.DropTable(
                name: "SecuencialLibro");

            migrationBuilder.DropTable(
                name: "Signatario");

            migrationBuilder.DropTable(
                name: "TipoAtencion");

            migrationBuilder.DropTable(
                name: "UnidadAdministrativaFuncionario");

            migrationBuilder.DropTable(
                name: "UnidadAdministrativaServicio");

            migrationBuilder.DropTable(
                name: "Ventanilla");

            migrationBuilder.DropTable(
                name: "Convenio");

            migrationBuilder.DropTable(
                name: "EntidadAuspiciante");

            migrationBuilder.DropTable(
                name: "Servicio");

            migrationBuilder.DropTable(
                name: "TipoExoneracion");

            migrationBuilder.DropTable(
                name: "PartidaArancelaria");

            migrationBuilder.DropTable(
                name: "Libro");

            migrationBuilder.DropTable(
                name: "Cargo");

            migrationBuilder.DropTable(
                name: "TipoPago");

            migrationBuilder.DropTable(
                name: "UnidadAdministrativa");

            migrationBuilder.DropTable(
                name: "TipoServicio");

            migrationBuilder.DropTable(
                name: "JerarquiaArancelaria");

            migrationBuilder.DropTable(
                name: "Banco");

            migrationBuilder.DropTable(
                name: "Nivel");

            migrationBuilder.DropTable(
                name: "TipoCuentaBancaria");

            migrationBuilder.DropTable(
                name: "TipoUnidadAdministrativa");

            migrationBuilder.DropTable(
                name: "Arancel");

            migrationBuilder.DropTable(
                name: "TipoArancel");

            migrationBuilder.DropTable(
                name: "Moneda");
        }
    }
}
