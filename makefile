SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.ONESHELL:
IMAGE_OWNER ?= kammin

# use timestamp from environment variable (if set) ej. multi stage build in travis
ifeq ($(TIMESTAMP),)
TIMESTAMP := $(shell date +'%Y%m%d%H%M')
endif

DOCKER_IMAGE_COMMIT := $(shell git log -1 --pretty=format:'%h')
DOCKER_IMAGE := $(IMAGE_OWNER)/aws-hashicorp-ansible:${TIMESTAMP}-${DOCKER_IMAGE_COMMIT}

help:           ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build:          ## Build docker image
	docker build -t ${DOCKER_IMAGE} aws-hashicorp-ansible/

up: build       ## Build and push docker image
    docker push ${DOCKER_IMAGE}