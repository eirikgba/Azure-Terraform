module "web" {
    source                      = "./modules/web"
    location                    = var.location
}

module "compute" {
    source                      = "./modules/compute"
    location                    = var.location
}

