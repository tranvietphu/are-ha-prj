
module "project_alb" {
  source             = "./modules/alb"
  ec2                = module.project_ec2.aws_instance
  subnet_ids         = module.vpc.public_subnet_ids
  vpc_id             = module.vpc.vpc_id
}