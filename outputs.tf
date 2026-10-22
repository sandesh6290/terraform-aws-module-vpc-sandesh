#VPC output
output "vpc_id_output" {
    value = aws_vpc.main.id
  
}

locals {
  #to format the subnet IDs which may be multiples in format of subnet_name = {id=, az=}
  public_subnet_output = {
    for key, config in local.public_subnet : key => {
        subnet_id = aws_subnet.main[key].id
        AZs = aws_subnet.main[key].availability_zone
    }
  }

  private_subnet_output = {
    for key, config in local.private_subnet : key => {
        subnet_id = aws_subnet.main[key].id
        AZs = aws_subnet.main[key].availability_zone
    }
  }
}

#subnet details
output "public_subnets" {
    value = local.public_subnet_output
  
}

output "private_subnets" {
    value = local.private_subnet_output
  
}