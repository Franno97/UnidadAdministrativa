#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["NuGet.Config", "."]
COPY ["host/Mre.Sb.AdministrativeUnit.HttpApi.Host/Mre.Sb.AdministrativeUnit.HttpApi.Host.csproj", "host/Mre.Sb.AdministrativeUnit.HttpApi.Host/"]
COPY ["src/Mre.Sb.AdministrativeUnit.HttpApi/Mre.Sb.AdministrativeUnit.HttpApi.csproj", "src/Mre.Sb.AdministrativeUnit.HttpApi/"]
COPY ["src/Mre.Sb.AdministrativeUnit.Application.Contracts/Mre.Sb.AdministrativeUnit.Application.Contracts.csproj", "src/Mre.Sb.AdministrativeUnit.Application.Contracts/"]
COPY ["src/Mre.Sb.AdministrativeUnit.Domain.Shared/Mre.Sb.AdministrativeUnit.Domain.Shared.csproj", "src/Mre.Sb.AdministrativeUnit.Domain.Shared/"]
COPY ["host/Mre.Sb.AdministrativeUnit.Host.Shared/Mre.Sb.AdministrativeUnit.Host.Shared.csproj", "host/Mre.Sb.AdministrativeUnit.Host.Shared/"]
COPY ["src/Mre.Sb.AdministrativeUnit.EntityFrameworkCore/Mre.Sb.AdministrativeUnit.EntityFrameworkCore.csproj", "src/Mre.Sb.AdministrativeUnit.EntityFrameworkCore/"]
COPY ["src/Mre.Sb.AdministrativeUnit.Domain/Mre.Sb.AdministrativeUnit.Domain.csproj", "src/Mre.Sb.AdministrativeUnit.Domain/"]
COPY ["src/Mre.Sb.AdministrativeUnit.Application/Mre.Sb.AdministrativeUnit.Application.csproj", "src/Mre.Sb.AdministrativeUnit.Application/"]
RUN dotnet restore "host/Mre.Sb.AdministrativeUnit.HttpApi.Host/Mre.Sb.AdministrativeUnit.HttpApi.Host.csproj"
COPY . .
WORKDIR "/src/host/Mre.Sb.AdministrativeUnit.HttpApi.Host"
RUN dotnet build "Mre.Sb.AdministrativeUnit.HttpApi.Host.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Mre.Sb.AdministrativeUnit.HttpApi.Host.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Mre.Sb.AdministrativeUnit.HttpApi.Host.dll"]
