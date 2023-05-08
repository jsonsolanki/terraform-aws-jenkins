# Deploy AWS EC2 Instances and Security Groups using  Terraform

### We are using terraform Data Source

- [AMI IMAGE](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)
- [AWS VPC](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc)

### What you need to change for deploy EC2 using this terraform code

- Clone this repository and go to the following folder `AWS/01-Terraform-EC2/EC2`.
- If you want to save your `tfstate` file into the s3 then you have to add your bucket name in the [backend.tf](https://github.com/jsonsolanki/terraform-aws-jenkins/blob/main/AWS/01-Terraform-EC2/EC2/backend.tf) file. and If you don't want to save your `tfstate` file into the s3 then you can remove this file either you can comment all lines in this file.
- open [terraform.tfvars](https://github.com/jsonsolanki/terraform-aws-jenkins/blob/main/AWS/01-Terraform-EC2/EC2/terraform.tfvars) file and add value for repective values.
- In owner variable, you need to choose any one Image owner ID out of three.

| Owner ID | AMI Name |
-----------|----------|
| amazon | Amazon AMI 2 |
| 099720109477 | Ubuntu 22.04 |
| 679593333241 | Cent OS 7 |


### If you want to create new key pair for instance you follow below steps :

- open [key_create.tf](https://github.com/jsonsolanki/terraform-aws-jenkins/blob/main/AWS/01-Terraform-EC2/EC2/key_create.tf) file and uncomment all lines from this file.
- Go to the [main.tf](https://github.com/jsonsolanki/terraform-aws-jenkins/blob/main/AWS/01-Terraform-EC2/EC2/main.tf) comment 6th number line and uncomment below code.
```
# key_name = aws_key_pair.generated_key.key_name
  # connection {
  #   type        = "ssh"
  #   host        = self.public_ip
  #   user        = "${lookup(var.username, "${var.owner}")}"

  #   # Mention the exact private key name which will be generated 
  #   private_key = file("${var.instance_name}.pem")
  #   timeout     = "4m"
  #   }
```

### Execute Terraform
```
# Terraform Initialize
terraform init

# Terraform Validate
terraform validate

# Terraform Plan
terraform plan
Observation: 
1) Review Security Group resources 
2) Review EC2 Instance resources
3) Review all other resources (vpc, subnet, security group and key name) 

# Terraform Apply
terraform apply -auto-approve
```

