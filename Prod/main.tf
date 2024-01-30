module "networking" {
    source = "./networking"
    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
    public_cidr = var.public_cidr
    us_availability_zone = var.us_az
}

module "security_groups" {
    source = "./security_groups"
    vpc_id = module.networking.vpc_id
    jenkins_ec2_sg_name = "jenkins_allow"
    jenkins_ec2_sg_name_portal = "jenkins_allow_portal"
}

module "jenkins_server" {
    source = "./jenkins_server"
    ami_image_owner = "099720109477"
    ami_image_name = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
    tag_name = "Jenkins:TF:Ubuntu"
    instance_type = "t3.micro"
    security_group_id = [module.security_groups.jenkins_security_group_id, module.security_groups.jenkins_security_group_id_portal]
    subnet_id = tolist(module.networking.public_subnets)[0]
    enable_public_ip_address = true
    user_data_install_jenkins = templatefile("./jenkins_script/install.sh", {})
    vm_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCkVs9njSV5gQ9Dkx9cjcIfcbHChPztmHhvdXUqluNd3TBAaEL8SNGDD2lk9llnbm2XEFhp0fKYDqoFGYGxdpHeQiupR3h+dD1lFvekqTt3evz5eFEKrl/BDPgeg3NXsQyUqaytbyuK0PvOl23rflXoNHqUJNNXQzVSgGO2ssl89hBLIk+bfG09e1uJV3AeAXDQPNFKPiediFvAiBQeYhwcU25UKHuZMNm1nPrCEAqAW4HsDi503FYAECzJDSvNqYqrbhMjmiVi9AbqLjUMEPUbTQECwrmnm7+6b3/SOB1Whtgi7nAZ8sZ1M5F38QFaM25nbPymRJvcA9hnG8zXaGQYKq7K52C0DiJXkOaxtvrFI7J73w9+/4oz8sELkysOhHMOPEhzSbYdAGi97djzcz3FEjDbZ6HGebAUzP6dzlkwo0uHtEMR39rbDaW/NzTJ9sSjA/CnIH3AjqQqPy91jxzrR/PkZGvO+Quyh78HZ5gVV6gjwoQ1VnPJtLZmXoSz3z8= azams@eurusvm"
}


output "ssh_connection_string" {
    value = "${module.jenkins_server.ssh_connection_string}"
}