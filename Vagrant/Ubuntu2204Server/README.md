Folgende Zeilen müssen im Vagrant noch extra angegeben werden, damit Vagrant eine SSH-Verbindung zur VM herstellen kann.

config.ssh.username = 'vagrant'
config.ssh.password = 'vagrant'
config.ssh.insert_key = false

Vagrant bringt noch folgenden Fehler:

==> default: Mounting shared folders...
    default: /vagrant => /home/joris/Documents/M300-Services/Vagrant/Ubuntu2204Server
Vagrant was unable to mount VirtualBox shared folders. This is usually
because the filesystem "vboxsf" is not available. This filesystem is
made available via the VirtualBox Guest Additions and kernel module.
Please verify that these guest additions are properly installed in the
guest. This is not a bug in Vagrant and is usually caused by a faulty
Vagrant box. For context, the command attempted was:

mount -t vboxsf -o uid=900,gid=900,_netdev vagrant /vagrant

The error output from the command was: