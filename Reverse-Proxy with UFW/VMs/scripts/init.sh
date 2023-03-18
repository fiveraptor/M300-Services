match='# hints.'
insert='ServerName localhost'
file='/etc/apache2/apache2.conf'

sed -i "s/$match/$match\n$insert/" $file