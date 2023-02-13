# Three-Tier-Architecture

# Architecture
This network architecture has three subnet tiers split across three availability zones. The web subnets also have a VPC routing table that will provide it access to the internet. The application and database tiers will not have such access; their routing tables will only allow internal network communication.

<img src="https://user-images.githubusercontent.com/83971386/127896132-06db5721-51ec-4c5f-81ee-6e39d14fa803.png" width="90%"></img>
# Prerequisites
* An AWS Account with an IAM user capable of creating resources – `AdminstratorAccess`
* A locally configured AWS profile for the above IAM user
* Terraform installation - [steps](https://learn.hashicorp.com/tutorials/terraform/install-cli)
* AWS EC2 key pair - [steps](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
* Environment Variables for AWS CLI - [steps](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)


# How to Apply/Destroy
This section details the deployment and teardown of the three-tier-architecture. **Warning: this will create AWS resources that costs money**

## Deployment Steps

#### 1.	Clone the repo
    git clone https://github.com/BJWRD/three-tier-architecture

#### 2. Access the relevant environment 
    cd dev
    
**NOTE:** The environment you choose is dependent on whether you plan to provision resources which are adequate for a `dev/stage/prod` environment.

#### 3. Update the s3 bucket name to your own - `versions.tf`

    backend "s3" {
      bucket = "ENTER HERE"
      key    = "terraform.tfstate"
      region = "eu-west-2"
    }

#### 4.	Initialise the TF directory
    terraform init

#### 5. Ensure the terraform code is formatted and validated 
    terraform fmt && terraform validate

#### 6. Create an execution plan
    terraform plan

#### 7. Execute terraform configuration 
    terraform apply --auto-approve

## Verification Steps 

#### 1. Check AWS Infrastructure
Check the infrastructure deployment status, by enter the following terraform command -

     terraform show

Enter Image

Alternatively, log into the AWS Console and verify your AWS infrastructure deployment from there.

#### VPC Verification

Enter Image

#### EC2 Verification

Enter Image

####  RDS Verification

Enter Image

#### 2. Verify bjwrd/app.py webapp is running via Docker 
Retrieve the ALB DNS address and search within your browser. You should then be able to see the Hello World response -

Enter Image 

Alternatively, curl the address from your terminal -

    curl <ENTER ADDRESS HERE>
    
Enter Image

## Teardown Steps

####  1. Destroy the deployed AWS Infrastructure 
`terraform destroy --auto-approve`

Enter Image

## Requirements
| Name          | Version       |
| ------------- |:-------------:|
| terraform     | ~>0.15.0      |
| aws           | ~>3.50.0      |

## Providers
| Name          | Version       |
| ------------- |:-------------:|
| aws           | ~>3.50.0      |

## Modules
| Name | Source |
|------|--------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | three-tier-architecture/modules/vpc |
| <a name="module_ec2"></a> [ec2](#module\_ec2) | three-tier-architecture/modules/ec2 |
| <a name="module_rds"></a> [rds](#module\_rds) | three-tier-architecture/modules/rds |

## Resources
| Name          | Type       |
| ------------- |:-------------:|
| [aws_launch_template](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_launch_template) | resource |
| [aws_db_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_db_instance) | resource |
| [aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_vpc) | resource |
| [aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_subnet) | resource |
| [aws_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_internet_gateway) | resource |
| [aws_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_route_table) | resource |
| [aws_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_route_table_association) | resource |
| [aws_lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_lb) | resource |
| [aws_lb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_lb_listener) | resource |
| [aws_lb_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_lb_target_group) | resource |
| [aws_autoscaling_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_autoscaling_group) | resource |
| [aws_db_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_db_subnet_group) | resource |
| [aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_security_group) | resource |
