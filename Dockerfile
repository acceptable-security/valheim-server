FROM steamcmd/steamcmd:ubuntu-18

ENV VALHEIM_NAME="ValheimName"
ENV VALHEIM_WORLD="ValheimWorld"
ENV VALHEIM_PASWORD="ValheimPassword"
ENV VALHEIM_PORT=2456

EXPOSE ${VALHEIM_PORT}/tcp
EXPOSE ${VALHEIM_PORT}/udp

RUN mkdir /valheim
WORKDIR /valheim

RUN echo "${VALHEIM_NAME}" > /valheim/name
RUN echo "${VALHEIM_PORT}" > /valheim/port
RUN echo "${VALHEIM_WORLD}" > /valheim/world
RUN echo "${VALHEIM_PASSWORD}" > /valheim/password

COPY ./run_valheim.sh /valheim

RUN steamcmd +login anonymous +force_install_dir /valheim +app_update 896660 validate +exit

ENTRYPOINT [ "bash", "/valheim/run_valheim.sh"]