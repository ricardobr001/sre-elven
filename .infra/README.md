## Terraform

To run this terraform, you'll need to create the `.env` file with your credentials, you can create the file following the `.env.example` and just fill the missing variables with your values:

```sh
cp .env.example .env
```

You also will need to create a bucket in the s3 and add its name in the already mentioned `.env` file

Before terraforming, check if you have the `ecsTaskExecutionRole` role created in your AWS account (https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html)
Also, this role will need the `CloudWatchLogsFullAccess` permission.

Then run the following command to create the infra in AWS

```sh
make init
make create-workspaces
make use-production # or use-staging
make plan # see what is going to be changed
make apply # apply the changes
```

## Pipeline
Some secrets are needed for Github Actions pipeline execution:

|Secret|Description|
|--|--|
|AWS_ACCESS_KEY_ID|ID da chave de acesso da AWS|
|AWS_SECRET_ACCESS_KEY|Chave de acesso da AWS|
|AWS_FRONTEND_BUCKET_NAME_STAGING|Bucket do frontend para o ambiente de staging  (criado via terraform)|
|AWS_FRONTEND_BUCKET_NAME_PRODUCTION|Bucket do frontend para o ambiente de production (criado via terraform)|
|AWS_FRONTEND_DISTRIBUTION_ID_STAGING|ID da distribuição do Cloudfront para o ambiente de Staging (criado via terraform)|
|AWS_FRONTEND_DISTRIBUTION_ID_PRODUCTION|ID da distribuição do Cloudfront para o ambiente de production (criado via terraform)|
|AWS_FRONTEND_API_URL_STAGING|URL da API para o ambiente de staging.|
|AWS_FRONTEND_API_URL_PRODUCTION|URL da API para o ambiente de production.|
|AWS_BACKEND_ENV_STAGING|Conteúdo do arquivo .env da para o ambiente de staging. Descrição do arquivo na próxima seção.|
|AWS_BACKEND_ENV_PRODUCTION|Conteúdo do arquivo .env da para o ambiente de production. Descrição do arquivo na próxima seção.|

## Formato do Arquivo de AWS_BACKEND_ENV_(STAGING|PRODUCTION)

```
APP_SECRET=
APP_API_URL=
APP_WEB_URL=
REDIS_HOST=
REDIS_PORT=
REDIS_PASS=
STORAGE_DRIVER=
MAIL_DRIVER=
POSTGRES_HOST=
POSTGRES_PORT=
POSTGRES_USERNAME=
POSTGRES_PASSWORD=
POSTGRES_DATABASE=
MONGO_HOST=
MONGO_PORT=
MONGO_USERNAME=
MONGO_PASSWORD=
MONGO_DATABASE=
MONGO_URL=
```
