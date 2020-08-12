#!/usr/bin/env make

# Import configuration using dot-env
# You can change the default config with `make cnf="config_special.env" build
# cnf ?= config.env
# include $(cnf)
# export $(shell sed -e 's/?=.*//' -e 's/=.*//' $(cnf) | tee .env)

.DEFAULT_GOAL := help

build-tomcat: ## Build Tomcat docker image
	@echo 'building tomcat docker image'
	tomcat/build.sh

up: ## Get containers up and running
	@echo 'getting up and running'
	docker-compose up -d

restart: ## Restart docker containers
	@echo 'restarting docker containers'
	docker-compose restart

# lint: ## Lint docker files
# 	@echo 'linting docker files'
# 	docker run --rm -i $(IMAGE_REGISTRY)/hadolint/hadolint < Dockerfile

# publish: tag-version ## Publish the `{IMAGE_VERSION}` tagged container
# 	@echo 'publishing version $(IMAGE_VERSION)'
# 	docker push $(IMAGE_TAG_VERSION)

# tag-version: ## Generate container `{IMAGE_VERSION}` tag
# 	@echo 'creating tag version $(IMAGE_VERSION)'
# 	docker tag $(IMAGE_NAME) $(IMAGE_TAG_VERSION)

# HELPERS

# clean: ## Cleanup
# 	-docker rmi $(IMAGE_NAME) $(IMAGE_TAG_VERSION)

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: help
