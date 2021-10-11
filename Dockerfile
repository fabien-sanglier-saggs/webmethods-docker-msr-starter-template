ARG BASE_IMAGE
FROM $BASE_IMAGE as base

LABEL maintainer="fabien.sanglier@softwareaggov.com" \
      name="webMethods Microservice API" \
      summary="Sample microservice API built with webMEthods Microservice Runtime"

# Optional: ADD license key (good option for a closed secure environment)
# But for general distribution though let's not...and have the users map their own license key
# COPY --chown=${SAG_USERID}:${SAG_GROUPID} assets/licenses/msr-licenseKey.xml $SAG_HOME/IntegrationServer/config/licenseKey.xml

# copy the package specific settings
COPY --chown=${SAG_USERID}:${SAG_GROUPID} application.properties $SAG_HOME/IntegrationServer/

# copy package(s) -- CHANGE "MyNewAPI" to the right package name
COPY --chown=${SAG_USERID}:${SAG_GROUPID} build/IS/MyNewAPI.zip $PACKAGES_DIR/
USER root
RUN true \
    && yum -y install unzip \
    && unzip $PACKAGES_DIR/MyNewAPI.zip -d $PACKAGES_DIR/MyNewAPI/ \
    && rm -f $PACKAGES_DIR/MyNewAPI.zip \
    && chown -R ${SAG_USERID}:${SAG_GROUPID} $PACKAGES_DIR/MyNewAPI/ \
    && yum remove -y unzip \
    && yum clean all \
    && true
USER ${SAG_USER}