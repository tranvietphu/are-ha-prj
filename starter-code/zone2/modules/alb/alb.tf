resource "aws_lb_target_group" "ubuntu_tg" {
  name     = "ubuntu-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "ubuntu_tg_att" {
  count            = 2
  target_group_arn = aws_lb_target_group.ubuntu_tg.arn
  target_id        = var.ec2.*.id[count.index]
  port             = 80
}

resource "aws_lb" "ubuntu_alb" {
  name               = "ubuntu-web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false

}

resource "aws_lb_listener" "ubuntu_alb_lis" {
  load_balancer_arn = aws_lb.ubuntu_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ubuntu_tg.arn
  }
}

resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  vpc_id      = var.vpc_id

  ingress {    
    description = "web port"
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
    Name = "alb_sg"
  }
}