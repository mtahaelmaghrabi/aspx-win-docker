# Builder Server
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
WORKDIR /src

# Restore dependencies
COPY aspx-win-docker.sln .
COPY aspx-win-docker.csproj aspx-win-docker.csproj 
COPY packages.config packages.config
RUN nuget restore

# Build
COPY . .
RUN msbuild /p:Configuration=Release /m

# publish
# need to create the publish folder profile first
RUN msbuild aspx-win-docker.csproj  /p:Configuration=Release /m /p:DeployOnBuild=true /p:PublishProfile=FolderProfile

# production runtime
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8
WORKDIR /inetpub/wwwroot
COPY --from=build /src/bin/Release/Publish/ .

# No need for CMD command
docker tag webapponwin:dev mtahaelmaghrabi/webapponwin:latest 
docker image push mtahaelmaghrabi/webapponwin:latest
# docker run -d -p 3080:80 webapponwin:dev
# docker build -t webapponwin:dev .
# docker exec -it <ContainerID> powershell