provider "baremetal" {
  tenancy_ocid = "${var.tenancy_ocid}"
  user_ocid = "${var.user_ocid}"
  fingerprint = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  private_key_password="${var.private_key_password}"
}

module "vcn" {
  source = "./modules/vcn"
  tenancy_ocid = "${var.tenancy_ocid}"
  compartment_ocid = "${var.compartment_ocid}"
}
module "node-1" {
  AD="1"
  source = "./modules/compute-instance"
  tenancy_ocid = "${var.tenancy_ocid}"
  subnet_ocid = "${module.vcn.subnet1_ocid}"
  compartment_ocid = "${var.compartment_ocid}"
  ssh_public_key = "${file(var.ssh_public_key_path)}"  
  instance_name = "Node-1"
}

module "node-2" {
  AD="2"
  source = "./modules/compute-instance"
  tenancy_ocid = "${var.tenancy_ocid}"
  subnet_ocid = "${module.vcn.subnet2_ocid}"
  compartment_ocid = "${var.compartment_ocid}"
  ssh_public_key = "${file(var.ssh_public_key_path)}"  
  instance_name = "Node-2"
}
module "node-3" {
  AD="3"
  source = "./modules/compute-instance"
  tenancy_ocid = "${var.tenancy_ocid}"
  subnet_ocid = "${module.vcn.subnet3_ocid}"
  compartment_ocid = "${var.compartment_ocid}"
  ssh_public_key = "${file(var.ssh_public_key_path)}"  
  instance_name = "Node-3"
}


module "user-config" {
    source = "./modules/user-config"
    tenancy_ocid = "${var.tenancy_ocid}"
    compartment_ocid = "${var.compartment_ocid}"
	node-1-public-ip = "${module.node-1.public_ip}"
        node-2-public-ip = "${module.node-2.public_ip}"
        node-3-public-ip = "${module.node-3.public_ip}"

    
	}



output "AD1 Node-1 PublicIP" {
  value = "${module.node-1.public_ip}"
}


output "AD2 Node-2 PublicIP" {
  value = "${module.node-2.public_ip}"
  }

output "AD3 Node-3 PublicIP" {
  value = "${module.node-3.public_ip}"
}




