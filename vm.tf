resource "aws_instance" "web" {
    
    ami           = "ami-062df10d14676e201"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.jenk-sg.id]
 
  tags = {
    Name = "pyvm1"
  }
}
resource "aws_security_group" "jenk-sg" {
  name = "j-grp"
  description = "Allow HTTP  traffic via Terraform"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
 output "ec2_instance_web" {
  description = "EC2 Instance Public IP"
  value = aws_instance.web.public_ip
}
