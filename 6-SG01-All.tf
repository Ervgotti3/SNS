resource "aws_security_group" "tfgapp1-80-sg01-servers" {
  name        = "tfgapp1-80-sg01-servers"
  description = "tfgapp1-80-sg01-servers"
  vpc_id      = aws_vpc.tfgapp1.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "OurGoldBox"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tfgapp1-80-sg01-servers"
    Service = "GetMoneyApp1"
    Group = "TechForGold"
    Planet = "RedPill"
    Owner = "Megatron"
  }

}

resource "aws_security_group" "tfgapp1-sg02-LB01" {
  name        = "tfgapp1-sg02-LB01"
  description = "tfgapp1-sg02-LB01"
  vpc_id      = aws_vpc.tfgapp1.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tfgapp1-sg02-LB01"
    Service = "GetMoneyApp1"
    Group = "TechForGold"
    Owner   = "Megatron"
    Planet = "RedPill"
  }
}
