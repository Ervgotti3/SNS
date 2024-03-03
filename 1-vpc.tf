# this  makes  vpc.id which is aws_vpc.app1.id
resource "aws_vpc" "tfgapp1" {
  cidr_block = "10.76.0.0/16" 

  tags = {
    Name = "app1"
    Service = "GetMoneyApp1"
    Owner = "Megatron"
    Group = "TechForGold"
    Planet = "RedPill"
  }
}