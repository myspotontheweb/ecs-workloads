
plan:
	terraform -chdir=terraform plan

init:
	terraform -chdir=terraform init

apply:
	terraform -chdir=terraform apply -auto-approve

destroy:
	terraform -chdir=terraform destroy -auto-approve

nuke:
	cloud-nuke aws --region eu-west-1 --dry-run

#
# How to update a service from the command-line
#
#update-service:
#	aws ecs update-service --cluster demo-cluster1 --service service-alpha --region eu-west-1 --task-definition $(shell aws ecs register-task-definition --cli-input-json file://./apps/service-alpha/dev.json --region eu-west-1 | jq '.taskDefinition.taskDefinitionArn')

