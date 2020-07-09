FROM openjdk:8-jre-slim

ENV SHEEPIT_VERSION 6.1721.0
ENV SHEEPIT_USERNAME ""
ENV SHEEPIT_PASSWORD ""


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    libxxf86vm1 libgl1-mesa-glx libglu1-mesa libfreetype6 \
    libsdl1.2debian libxi6 libxrender1 libxfixes3 && \
    rm -rf /var/lib/apt/lists/*

RUN addgroup --system sheepit \
    && adduser --disabled-login --system --home /var/cache/sheepit --shell /sbin/nologin --ingroup sheepit sheepit

RUN curl -o /sheepit-client.jar -SL "https://www.sheepit-renderfarm.com/media/applet/sheepit-client-$SHEEPIT_VERSION.jar"

USER sheepit
CMD java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -jar /sheepit-client.jar -ui text -login $SHEEPIT_USERNAME -password $SHEEPIT_PASSWORD -cache-dir /var/cache/sheepit
