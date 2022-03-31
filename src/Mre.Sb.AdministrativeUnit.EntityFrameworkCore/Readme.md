Add-Migration "Inicial"  -Context UnidadAdministrativaDbContext


Update-Database -Context  UnidadAdministrativaDbContext


Script-Migration -Context UnidadAdministrativaDbContext -From CorregirReferenciaPartidaServicio

# Generar script migracion
# Generar script desde la primera migracion hasta la ultima
Script-Migration -Context UnidadAdministrativaDbContext 0


# .NET Core CLI

En la carpeta del Ef. "AdministrativeUnit\src\Mre.Sb.AdministrativeUnit.EntityFrameworkCore", ejecutar el comando para actualizar la base de datos.

```
dotnet ef database update --startup-project ../../host/Mre.Sb.AdministrativeUnit.HttpApi.Host --context UnidadAdministrativaDbContext
```