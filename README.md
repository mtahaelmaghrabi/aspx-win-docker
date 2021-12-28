# A sample application/Dockerfile to demonstrate the ability of building a Windows docker images out of .NET Framework applications

### To build the image
```
docker build -t webapponwin:dev .
```

### To run a container out of the image
```
docker run -d -p 8080:80 webapponwin:dev
```
