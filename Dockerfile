FROM python:3-buster

EXPOSE 8080
WORKDIR /docker/

ENV KOLIBRI_HOME=/kolibri-home
ENV POPULATE_CONTENT=false

RUN pip install kolibri
RUN pip install kolibri-explore-plugin

# plugin enable
RUN kolibri plugin enable kolibri.plugins.app
RUN kolibri plugin disable kolibri.plugins.learn
RUN kolibri plugin enable kolibri_explore_plugin

# helpers to populate the content
COPY populate/options.ini ${KOLIBRI_HOME}/options.ini
COPY populate/automatic_provision.json ${KOLIBRI_HOME}/automatic_provision.json
COPY populate/kolibri-pick-content-from-channel /docker/kolibri-pick-content-from-channel
COPY populate/populate.sh /docker/populate.sh

COPY entrypoint.sh /docker/entrypoint.sh
ENTRYPOINT [ "/docker/entrypoint.sh" ]
