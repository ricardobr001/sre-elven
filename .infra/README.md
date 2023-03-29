## Terraform

To run this terraform, you'll need to create the `.env` file with your credentials, you can create the file following the `.env.example` and just fill the missing variables with your values

```sh
cp .env.example .env
```

After that, you need to create a bucket in the s3 with the name `gobarber-state` and then run the following command to create the infra in AWS

```sh
make init
make create-workspaces
make plan # see what is going to be changed
make apply # apply the changes
```
