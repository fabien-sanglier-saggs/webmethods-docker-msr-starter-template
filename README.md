# webmethods-docker-msr-starter-template
A sample webMethods project to demonstrate the creation of an API by only using Docker-based runtimes throughout the development and deployment
## Requirements
### License

If you have a license of MSR (which will be required to run the MSR runtime), make sure to download it and add it to the following path:
./assets/licenses/msr-licenseKey.xml
So it can be picked up by the build process and added in the right place downstream.

### Developing the Solution

In order to actually develop the solution, a developer will need webMethods Designer (standard Eclipse with extra webMethods components / perspectives)
More info on how to download and install designer for free at: https://tech.forums.softwareag.com/t/guide-to-download-and-install-webmethods-service-designer-free-download/235210

## Develop the project

```bash
docker-compose -f docker-localdev.yml up -d
```

## Build the docker images

```bash
docker-compose build
```

## Run

```bash
docker-compose up -d
```