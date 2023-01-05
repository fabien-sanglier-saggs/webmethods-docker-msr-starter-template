# webmethods-docker-msr-starter-template

A sample webMethods microservice runtime starter template project to use as a quick start for development...

## Requirements
### SoftwareAG webMethods Product Licenses

If you have a license of MSR (which will be required to run the MSR runtime), make sure to download it and add it to the following path:

./licenses/msr-licenseKey.xml

So it can be picked up by the build process and added in the right place downstream.

### SoftwareAG webMethods Development tooling

In order to actually develop the solution, a developer will need webMethods Designer (standard Eclipse with extra webMethods components / perspectives), ideally loaded with "local service development" components.

## Develop the project

- Start Designer

- Start Local MSR on laptop

- Start the related components needed by the development (ie. databases, universal messaging, etc...)

```bash
docker-compose -f localdev.yml up -d
```

## Build the docker images

```bash
sh build-manual.sh
```

## Run the deployment

Here, this is to run the full project including the latest built images etc...
The target container orchestration depends on what you need...

### Docker-compose deployment

For example, for a simple docker-compose deployment, run:

```bash
docker-compose -f deployments/docker/docker-compose.yml up -d
```