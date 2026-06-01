FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    fonts-dejavu-core \
    fluxbox \
    libsfml-dev \
    novnc \
    websockify \
    x11vnc \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

COPY docker/entrypoint.sh /usr/local/bin/pm-farm-entrypoint
RUN chmod +x /usr/local/bin/pm-farm-entrypoint && chmod +x /app/build/main

EXPOSE 6080

ENTRYPOINT ["pm-farm-entrypoint"]
