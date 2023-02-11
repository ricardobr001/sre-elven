TERRAFORM_VERSION= 1.2.9
TFSTATE_BUCKET=<TFSTATE_BUCKET_NAME>

DOCKER_COMMAND=\
	AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>\
	AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>\
	TERRAFORM_VERSION=${TERRAFORM_VERSION}\
	docker-compose run sre_terraform

create-workspaces:
	 @${DOCKER_COMMAND} \
	 	bash -c "tfenv use ${TERRAFORM_VERSION} && \
		 terraform -chdir=terraform/ workspace new staging" || true
	@${DOCKER_COMMAND} \
	 	bash -c "tfenv use ${TERRAFORM_VERSION} && \
		 terraform -chdir=terraform/ workspace new production " || true

list-workspaces:
	 @${DOCKER_COMMAND} \
	 	bash -c "tfenv use ${TERRAFORM_VERSION} && \
		 terraform -chdir=terraform/ workspace list"

use-staging:
	 @${DOCKER_COMMAND} \
	 	bash -c "tfenv use ${TERRAFORM_VERSION} && \
		 terraform -chdir=terraform/ workspace select staging"

use-production:
	 @${DOCKER_COMMAND} \
	 	bash -c "tfenv use ${TERRAFORM_VERSION} && \
		 terraform -chdir=terraform/ workspace select production"

bash:
	 @${DOCKER_COMMAND} \
	 	bash -c "ls -la"
	
init:
	echo ${TFSTATE_BUCKET}
	 @${DOCKER_COMMAND} \
	 	bash -c "tfenv use ${TERRAFORM_VERSION} && \
		 terraform -chdir=terraform/ init -backend-config=\"bucket=${TFSTATE_BUCKET}\""

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
