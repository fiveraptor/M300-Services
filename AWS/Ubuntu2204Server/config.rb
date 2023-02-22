$aws_options = {}
# Access und Secret Key vom User vagrant-user
$aws_options[:access_key] = "AKIAZ4D7UB3JVYN5EUHD"
$aws_options[:secret_key] = "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"
# Der Name des erstellten Key Pairs
$aws_options[:ec2_keypair] = "vagrant.pem"
# Region Frankfurt 
$aws_options[:region] = "eu-central-1"
# Ubuntu 14.04 Images 
$aws_options[:ami_id] = "ami-26c43149"
$aws_options[:instance_type] = "t2.micro"
# Der Name der erstellten Security Group
$aws_options[:security_group] = "vagrant"
