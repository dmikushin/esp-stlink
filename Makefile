ESP_OPEN_SDK=/opt/esp-open-sdk
XTENSA_TOOLS_ROOT=$(ESP_OPEN_SDK)/xtensa-lx106-elf/bin
SDK_BASE=$(ESP_OPEN_SDK)/sdk
DOCKER_RUN=docker run -e ESP_OPEN_SDK=$(ESP_OPEN_SDK) -e XTENSA_TOOLS_ROOT=$(XTENSA_TOOLS_ROOT) -e SDK_BASE=$(SDK_BASE) -v $(shell pwd):$(shell pwd) -w $(shell pwd) -u $(shell id -u):$(shell id -g) marcusmae/esp-stlink-docker:latest

.PHONY: all flash clean

all:
	$(DOCKER_RUN) make -C src V=1 && make -C lib V=1

flash: all
	make -C src flash V=1

clean:
	$(DOCKER_RUN) make -C src clean && make -C lib clean
