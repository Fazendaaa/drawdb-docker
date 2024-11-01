REGISTRY_OWNER:=fazenda
PROJECT_TAG:=latest
PROJECT:=drawdb

all: publish

publish:
	@docker buildx build --push --tag ${REGISTRY_OWNER}/${PROJECT}:${PROJECT_TAG} .
