FROM vrlo/docker-esp-open-sdk:latest AS source

FROM ubuntu:24.04

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /opt/esp-open-sdk 

COPY --from=source /home/espbuilder/esp-open-sdk/xtensa-lx106-elf /opt/esp-open-sdk/xtensa-lx106-elf
COPY --from=source /home/espbuilder/esp-open-sdk/esp_iot_sdk_v1.4.0 /opt/esp-open-sdk/sdk
COPY --from=source /home/espbuilder/source-code-examples /opt/esp-open-sdk/source-code-examples

RUN apt update && \
    apt install -y esptool python3 make && \
    apt clean

