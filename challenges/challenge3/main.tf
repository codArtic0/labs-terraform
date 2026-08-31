module "webserver" {
  source = "./modules/ec2"
  ec2name = "webserver"
}
module "dbserver" {
  source = "./modules/ec2"
  ec2name = "dbserver"
}