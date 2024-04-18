DOCKER_IMAGE=edur-ui
DOCKERFILE_PATH=docker/Dockerfile.edur

.PHONY: build_image
build_image: 
	docker build . -f ${DOCKERFILE_PATH} -t ${DOCKER_IMAGE}

.PHONY: ecr_login
ecr_login:
	aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 710339184759.dkr.ecr.us-west-2.amazonaws.com

.PHONY: push_image
push_image: ecr_login build_image
	docker tag ${DOCKER_IMAGE}:latest 710339184759.dkr.ecr.us-west-2.amazonaws.com/edur-ui:latest
	docker push 710339184759.dkr.ecr.us-west-2.amazonaws.com/edur-ui:latest

build: 
	npx nx build edur
	aws s3 sync dist/apps/edur s3://demidrek-heyward-development-static-site-bucket
