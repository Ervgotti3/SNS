resource "aws_internet_gateway" "tfg_igw" {
vpc_id = aws_vpc.tfgapp1.id

tags = {
    Name = "app1-TFG-GW"
    Service = "getmoneyapp1"
    Group = "TechForGold"
    Owner = "Megatron"
    Planet = "RedPill"
  }
}