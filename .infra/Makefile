TERRAFORM_VERSION= 1.2.9

DOCKER_COMMAND=\
	AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>\
	AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>\
	TERRAFORM_VERSION=${TERRAFORM_VERSION}\
	docker-compose run sre_terraform
	
bash:
	 @${DOCKER_COMMAND} \
	 	bash -c "ls -la"
	
init:
	 @${DOCKER_COMMAND} \
	 	bash -c "tfenv use ${TERRAFORM_VERSION} && \
		 terraform -chdir=terraform/ init"

plan:
	 @${DOCKER_COMMAND} \
	 	bash -c "tfenv use ${TERRAFORM_VERSION} && \
		 terraform -chdir=terraform/ plan"

apply:
	 @${DOCKER_COMMAND} \
	 	bash -c "tfenv use ${TERRAFORM_VERSION} && \
		 terraform -chdir=terraform/ apply -auto-approve"

destroy:
	 @${DOCKER_COMMAND} \
	 	bash -c "tfenv use ${TERRAFORM_VERSION} && \
		 terraform -chdir=terraform/ destroy"

up: init apply

down: destroy
