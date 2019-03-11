


/*
resource "aws_instance" "dev-developer_name-001" {
    count                       = "${ length( var.developer ) }"
    ami                         = "${lookup(var.ec2_options, "default.ami")}"
    availability_zone           = "ap-northeast-1c"
    ebs_optimized               = true
    instance_type               = "${lookup(var.ec2_options, "default.instance_type")}"
    monitoring                  = false
    key_name                     = "${aws_key_pair.sonic883b.key_name}"
    subnet_id                   = "${lookup(var.ec2_options, "default.subnet_id")}"
    #vpc_security_group_ids      = ["sg-0daff01d3e386427e", "sg-0a803e810cfb05f42"]
    associate_public_ip_address = true
    source_dest_check           = true

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 32
        delete_on_termination = true
    }

    tags {
        "Hostname" = "${lookup(var.ec2_options, "default.hostname")}-${element(var.developer,count.index)}-001.domain.jp"
        "Components" = "test-dev"
        "Service" = "sonic883b"
        "SshKey" = "${aws_key_pair.sonic883b.key_name}"
        "isSchedule" = "true"
        "Name" = "${lookup(var.ec2_options, "bastion.name")}-${element(var.developer,count.index)}-001"
        "Stage" = "develop"
        "SshUser" = "centos"
    }
}
*/