## Terraform

To run this terraform, you'll need to create the `.env` file with your credentials, you can create the file following the `.env.example` and just fill the missing variables with your values

```sh
cp .env.example .env
```

You also will need to create a bucket in the s3 and add its name in the already mentioned `.env` file

Before terraforming, check if you have the `ecsTaskExecutionRole` role created in your AWS account (https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html)

Then run the following command to create the infra in AWS

```sh
make init
make create-workspaces
make plan # see what is going to be changed
make apply # apply the changes
```
