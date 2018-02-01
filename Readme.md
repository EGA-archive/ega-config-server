# EGA.Data.API.v3.CONFIG

This is a standalone Spring Configuration server. It is configured to run on port 8888. The correct URL to this service must be specified in all micro services using the configuration server.

There are no dependencies.

This service provides `application.properties` files to micro services using the configuration server. This allows for centralised configuration management for multiple micro services, and it removes any configuration files from the source code.

The `application.properties` files are configured to be stored in directory `/config` on the server hosting the confoguration service. The name for the properties file of a micro servcice named `{app.name}` is `"{app.name}.properties"`


## Getting Started

These instructions will get you a copy of the project up and running on your local machine.

### Installing

The repository contains pre-compiled jar files with the client. To build it on your local machine, run

```
mvn package
```

This will produce the Config service jar file in the /target directory.

### Experimental [under construction]

The service can be deployed directly to a Docker container, using these instructions:

`wget https://raw.github.com/elixir-europe/ega-data-api-v3-config/master/docker/runfromsource.sh`  
`wget https://raw.github.com/elixir-europe/ega-data-api-v3-config/master/docker/build.sh`  
`chmod +x runfromsource.sh`  
`chmod +x build.sh`  
`sudo ./runfromsource.sh {config dir}`  

The `{config dir}` should be the absolute path where configuration files are stored. This directory will be mapped to a standardised path inside of the container, where the process will expect to find Spring .properties files.  

These commands perform a series of actions:  
1. Pull a build environment from Docker Hub  
2. Run the 'build.sh' script inside of a transient build environment container.  
3. The source code is pulled from GitHub and built  
4. A Deploy Docker Image is built and the compiled service is added to the image  
5. The deploy image is started; the service is automatically started inside the container  
  
The Docker image can also be obtained directly from Docker Hub:  

`sudo docker run -d -p 8888:8888 -v {config dir}:/config alexandersenf/ega_config`  or by running the `./runfromimage.sh {config dir}` file.

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE.md](LICENSE.md) file for details
