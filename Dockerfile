
ARG BASE_IMAGE
FROM $BASE_IMAGE as base

LABEL maintainer="maintainer" \
      name="name" \
      summary="summary"

ENV ADMINISTRATOR_PASSWORD="default"

# Optional: ADD license key into the container
# Another more flexible approach is to NOT bake the license file in, 
# and instead you should have the license mapped at deployment time (ie. volumes, config maps, etc...)
# COPY --chown=${SAG_USERID}:${SAG_GROUPID} licenses/msr-licenseKey.xml $SAG_HOME/IntegrationServer/config/licenseKey.xml

# copy possible libs into the right folder
COPY --chown=${SAG_USERID}:${SAG_GROUPID} libs/ $SAG_HOME/IntegrationServer/lib/jars/custom/

# copy the package specific settings
COPY --chown=${SAG_USERID}:${SAG_GROUPID} assets/IS/configs/application.properties $SAG_HOME/IntegrationServer/

# copy package(s)
COPY --chown=${SAG_USERID}:${SAG_GROUPID} assets/IS/packages/MyNewAPI $SAG_HOME/IntegrationServer/packages/MyNewAPI

# run Jcode to build the java code
RUN true \
    && $SAG_HOME/IntegrationServer/bin/jcode.sh make MyNewAPI \
    && true