FROM python:3-buster

ENV KOLIBRI_HOME=/kolibri-home
ENV POPULATE_CONTENT=false
ENV EXPLORE_VERSION=stable

RUN apt update
RUN apt install -y git
RUN pip install kolibri

EXPOSE 8080

WORKDIR /docker/

COPY options.ini ${KOLIBRI_HOME}/options.ini
COPY automatic_provision.json ${KOLIBRI_HOME}/automatic_provision.json
COPY kolibri-pick-content-from-channel /docker/kolibri-pick-content-from-channel

COPY entrypoint.sh /docker/entrypoint.sh
COPY populate.sh /docker/populate.sh
COPY build-plugin.sh /docker/build-plugin.sh
ENTRYPOINT [ "/docker/entrypoint.sh" ]
