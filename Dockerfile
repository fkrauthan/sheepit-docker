FROM openjdk:11-jre-slim

ENV SHEEPIT_VERSION 7.23099.0
ENV SHEEPIT_USERNAME ""
ENV SHEEPIT_PASSWORD ""
ENV SHEEPIT_COMPUTE_METHOD "CPU"
# If we make the default memory limit a large number, then unless a lower number is set 'no memory limit' is applied (as 999GB is going to be larger than the maximum you'd ever want to use)
# I tried 1TB. It doesn't work.
ENV SHEEPIT_MEMORY_LIMIT "999GB"


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
# CMD java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -jar /sheepit-client.jar -ui text -login $SHEEPIT_USERNAME -password $SHEEPIT_PASSWORD -cache-dir /var/cache/sheepit -memory $SHEEPIT_MEMORY_LIMIT
CMD if [ "$SHEEPIT_COMPUTE_METHOD" = "CPU" ]; \
then java -jar /sheepit-client.jar -ui text -login $SHEEPIT_USERNAME -password $SHEEPIT_PASSWORD -cache-dir /var/cache/sheepit -memory $SHEEPIT_MEMORY_LIMIT ;\
else java -jar /sheepit-client.jar -ui text -login $SHEEPIT_USERNAME -password $SHEEPIT_PASSWORD -gpu CUDA_0 -compute-method GPU -cache-dir /var/cache/sheepit -memory $SHEEPIT_MEMORY_LIMIT; \
fi
