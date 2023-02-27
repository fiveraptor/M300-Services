$aws_options = {}
# Access und Secret Key vom User vagrant-user

# Der Name des erstellten Key Pairs
# Region Frankfurt 
$aws_options[:region] = "eu-central-1"
# Ubuntu 14.04 Images 
$aws_options[:ami_id] = "ami-0e067cc8a2b58de59"
$aws_options[:instance_type] = "t2.micro"
# Der Name der erstellten Security Group
$aws_options[:security_group] = "vagrant"
