# Create a security group to allow Swarm and web traffic
resource "aws_security_group" "swarm_sg" {
    vpc_id                  = "${aws_vpc.ec2_swarm_vpc.id}"
    name                    = "swarm-sg"
    description             = "Security group for Swarm traffic"
    ingress {
        from_port           = "2375"
        to_port             = "2377"
        protocol            = "tcp"
        cidr_blocks         = ["${aws_vpc.ec2_swarm_vpc.cidr_block}"]
    }
    ingress {
        from_port           = "7946"
        to_port             = "7946"
        protocol            = "tcp"
        cidr_blocks         = ["${aws_vpc.ec2_swarm_vpc.cidr_block}"]
    }
    ingress {
        from_port           = "7946"
        to_port             = "7946"
        protocol            = "udp"
        cidr_blocks         = ["${aws_vpc.ec2_swarm_vpc.cidr_block}"]
    }
    ingress {
        from_port           = "4789"
        to_port             = "4789"
        protocol            = "tcp"
        cidr_blocks         = ["${aws_vpc.ec2_swarm_vpc.cidr_block}"]
    }
    ingress {
        from_port           = "4789"
        to_port             = "4789"
        protocol            = "udp"
        cidr_blocks         = ["${aws_vpc.ec2_swarm_vpc.cidr_block}"]
    }
    ingress {
        from_port           = "22"
        to_port             = "22"
        protocol            = "tcp"
        cidr_blocks         = ["0.0.0.0/0"]
    }
    egress {
        from_port           = "0"
        to_port             = "0"
        protocol            = "-1"
        cidr_blocks         = ["0.0.0.0/0"]
    }
    tags {
        tool                = "terraform"
        demo                = "ec2-swarm"
        area                = "security"
    }
}

# Create a security group to allow inbound SSH (for manager only)
resource "aws_security_group" "web_sg" {
    vpc_id                  = "${aws_vpc.ec2_swarm_vpc.id}"
    name                    = "web-sg"
    description             = "Security group for web traffic"
    ingress {
        from_port           = "80"
        to_port             = "80"
        protocol            = "tcp"
        cidr_blocks         = ["0.0.0.0/0"]
    }
    ingress {
        from_port           = "443"
        to_port             = "443"
        protocol            = "tcp"
        cidr_blocks         = ["0.0.0.0/0"]
    }
    egress {
        from_port           = "0"
        to_port             = "0"
        protocol            = "-1"
        cidr_blocks         = ["0.0.0.0/0"]
    }
    tags {
        tool                = "terraform"
        demo                = "ec2-swarm"
        area                = "security"
    }
}
