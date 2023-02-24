$aws_options = {}
# Access und Secret Key vom User vagrant-user
$aws_options[:access_key] = ""
$aws_options[:secret_key] = ""
# Der Name des erstellten Key Pairs
$aws_options[:ec2_keypair] = "vagrant.pem"
# Region Frankfurt 
$aws_options[:region] = "eu-central-1"
# Ubuntu 14.04 Images 
$aws_options[:ami_id] = "ami-0d1ddd83282187d18"
$aws_options[:instance_type] = "t2.micro"
# Der Name der erstellten Security Group
$aws_options[:security_group] = "vagrant"
