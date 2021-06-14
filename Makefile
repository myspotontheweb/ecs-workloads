
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

