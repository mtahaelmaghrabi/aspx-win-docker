# Builder Server
#FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
#WORKDIR /src

FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2019 AS build
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
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019
WORKDIR /inetpub/wwwroot
COPY --from=build /src/bin/Release/Publish/ .



## to build the image
#docker build -t mtahaelmaghrabi/webapponwin:latest .

## to create a container based on the image
#docker container run -d -p 89:80 --name winapp mtahaelmaghrabi/webapponwin:latest

## Create another tags
#docker image tag evaluation:dev mtahaelmaghrabi/evaluation:latest
#docker image tag evaluation:dev pphrcontainers.azurecr.io/evaluation:latest

## To Push the image to DockerHub
#docker image push mtahaelmaghrabi/webapponwin:latest
#docker container run -d -p 888:80 --network hrnetwork --name empservice888 mtahaelmaghrabi/evaluation:latest

## to explore the running container
#docker container exec -it web3 bash

## to delete the container & the image
#docker container rm -f web3
#docker image rm simpledockerfile1:dev

#kubectl rollout restart deployment 