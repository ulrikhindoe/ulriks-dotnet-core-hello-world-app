# https://hub.docker.com/_/microsoft-dotnet-core
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY *.sln .
COPY ulriks-dotnet-core-hello-world-app/*.csproj ./ulriks-dotnet-core-hello-world-app/
RUN dotnet restore

# copy everything else and build app
COPY ulriks-dotnet-core-hello-world-app/. ./ulriks-dotnet-core-hello-world-app/
WORKDIR /source/ulriks-dotnet-core-hello-world-app
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "ulriks-dotnet-core-hello-world-app.dll"]