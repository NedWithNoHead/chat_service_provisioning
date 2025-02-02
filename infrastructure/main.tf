module "ssh_key" {
  source       = "git::https://gitlab.com/acit_4640_library/tf_modules/aws_ssh_key_pair.git"
  ssh_key_name = "acit_4640_lab_13"
  output_dir   = path.root
}

module "connect_script" {
  source           = "git::https://gitlab.com/acit_4640_library/tf_modules/aws_ec2_connection_script.git"
  ec2_instances    = { "i1" = module.ec2.instance1, "i2" = module.ec2.instance2 }
  output_file_path = "${path.root}/connect_vars.sh"
  ssh_key_file     = module.ssh_key.priv_key_file
  ssh_user_name    = "ubuntu"
}

module "vpc" {
  source = "./modules/vpc"
}
module "ec2" {
  source            = "./modules/ec2"
  subnet1_id        = module.vpc.subnet1_id
  subnet2_id        = module.vpc.subnet2_id
  pubic_security_group = module.vpc.pubic_security_group
  private_security_group = module.vpc.private_security_group
  ssh_key_name      = module.ssh_key.ssh_key_name
}

module "dns_dhcp" {
  source    = "./modules/dns_dhcp"
  vpc_id    = module.vpc.vpc_id
  instance1 = module.ec2.instance1
  instance2 = module.ec2.instance2

}