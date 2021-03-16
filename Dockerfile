FROM python:3-buster

ENV KOLIBRI_HOME=/kolibri-home
ENV POPULATE_CONTENT=false
ENV EXPLORE_VERSION=stable

RUN pip install kolibri

EXPOSE 8080

COPY options.ini ${KOLIBRI_HOME}/options.ini
COPY automatic_provision.json ${KOLIBRI_HOME}/automatic_provision.json
COPY kolibri-pick-content-from-channel /docker/kolibri-pick-content-from-channel

WORKDIR /docker/
COPY entrypoint.sh /docker/entrypoint.sh
ENTRYPOINT [ "/docker/entrypoint.sh" ]
