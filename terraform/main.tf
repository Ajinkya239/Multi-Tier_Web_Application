resource "aws_default_vpc" "main" {
#  cidr_block = "10.0.0.0/16"
#  tags = {
#    Name = "main-vpc"
#  }
}

#resource "aws_internet_gateway" "gw" {
#  vpc_id = aws_vpc.main.id
#}

#resource "aws_subnet" "public" {
#	vpc_id = aws_vpc.main.id
#	cidr_block = "10.0.1.0/24"
#	availability_zone = "us-west-2a"
#	tags = {
#	 Name = "public-subnet"
#	}
#	depends_on = [aws_internet_gateway.gw]
#}

#resource "aws_subnet" "private" {
#        vpc_id = aws_vpc.main.id
#        cidr_block = "10.0.2.0/24"
#        availability_zone = "us-west-2a"
#        tags = {
#         Name = "private-subnet"
#        }
#}

resource "aws_security_group" "my_sg" {
	vpc_id = aws_default_vpc.main.id
	name = "multi_sg"

	ingress {
	 from_port = 80
	 to_port = 80
	 protocol = "tcp"
	 cidr_blocks = ["0.0.0.0/0"]
	}
	
	egress {
	 from_port = 0
	 to_port = 0
	 protocol = "-1"
	 cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_instance" "web" {
	ami = "ami-02d3770deb1c746ec"
	instance_type = "t2.micro"
#	subnet_id = aws_subnet.public.id
	key_name = aws_key_pair.ssh_key.key_name
  	tags = {
    	 Name = "web-server"
  	}
	security_groups = [aws_security_group.my_sg.name]
}

#resource "aws_eip" "inst1" {
#	instance = aws_instance.web.id
#	domain   = "vpc"
#}

resource "aws_instance" "app" {
	ami = "ami-02d3770deb1c746ec"
	instance_type = "t2.micro"
#	subnet_id = aws_subnet.public.id
	key_name = aws_key_pair.ssh_key.key_name
	tags = {
	 Name = "app-server"
	}
	security_groups = [aws_security_group.my_sg.name]
}
	

#resource "aws_eip" "inst2" {
#        instance = aws_instance.app.id
#        domain   = "vpc"
#}

resource "aws_instance" "db" {
	ami = "ami-02d3770deb1c746ec"
	instance_type = "t2.micro"
#	subnet_id = aws_subnet.public.id
	key_name = aws_key_pair.ssh_key.key_name
	tags = {
	 Name = "db-server"
	}
	security_groups = [aws_security_group.my_sg.name]
}
#resource "aws_eip" "inst3" {
#        instance = aws_instance.db.id
#        domain   = "vpc"
#}
