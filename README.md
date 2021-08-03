# Three-Tier-Architecture

# Architecture
This network architecture has three subnet tiers split across three availability zones. The web subnets also have a VPC routing table that will provide it access to the internet. The application and database tiers will not have such access; their routing tables will only allow internal network communication.

<img src="https://user-images.githubusercontent.com/83971386/127896132-06db5721-51ec-4c5f-81ee-6e39d14fa803.png" width="90%"></img>
# Pre-requisites 
* An AWS Account with an IAM user capable of creating resources – ‘AdminstratorAccess
* A locally configured AWS profile for the above IAM user
* Terraform installation - [steps](https://learn.hashicorp.com/tutorials/terraform/install-cli)
* AWS EC2 key pair - [steps](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
* Environment Variables for AWS CLI - [steps](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

# How to Apply/Destroy
This section details the deployment and teardown of the three-tier-architecture. **Warning: this will create AWS resources that costs money**

**Deployment steps**

1.	Clone the repo
`git clone`

2.	Access the relevant environments – dev, stage, prod
`cd dev`

3.	Initialise the working directory, which contains the tf configuration 
`terraform init`

4.	 Ensure the terraform code is formatted and validated 
`terraform fmt` and `terraform validate`

5.	Create an execution plan
`terraform plan`

6.	Execute terraform configuration 
`terraform apply --auto-approve`

**Teardown steps**

1.	Destroy the deployed AWS Infrastructure 
`terraform destroy --auto-approve`


# Requirements
| Name          | Version       |
| ------------- |:-------------:|
| terraform     | ~>0.15.0      |
| aws           | ~>3.44.0      |

# Providers
| Name          | Version       |
| ------------- |:-------------:|
| aws           | ~>3.44.0      |


# List of tools/services used
* terraform
* awscli
* drawio
* Bash
* EC2 (Launch Templates – Application Load Balancers – Security Groups – Subnets – Auto Scaling Groups)
* VPC (Subnets – Route Tables – Internet Gateway)
* RDS (MySQL)
