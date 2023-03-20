# Automatischer Minecraft Server
Hier wird automatisch ein Ubuntu Server aufgesetzt und auf diesem wird automatisch einen Minecraft Server bereitgestellt. Der Minecraft Server Ordner auf der VM wird mit einem lokalen Ordner synchronisiert. So muss/kann man beim ersten aufsetzen die Server Datei "paper-1.19-81.jar" in diesen Ordner legen und danach kann man auch diverse anpassungen ganz einfach durchführen. Die Firewall ist ebenfalls so konfiguriert dass sie nur Traffic über den Port 25565 (Minecraft Server Port) zulässt und man per SSH nur vom lokalen Computer auf die VM zugreifen kann.

## Vagrantfile
Im Vagrantfile wurden folgende anpassungen Durchgeführt.
- Es wurde der Port 25565 vom lokalen Computer in die VM weitergeleitet.
    ```ruby
    config.vm.network "forwarded_port", guest:25565, host:25565, auto_correct: false
    ```
- Der zu synchronisierende Minecraft Server Ordner wurde angegeben.
    ```ruby
    config.vm.synced_folder "MCServer/", "/home/vagrant/MCServer"
    ```
- Die VM Leistung wurde ebenfalls angepasst.
    ```ruby
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = 4
    end
    ```
- Und zum schluss die beiden Provisioning Scripts, die dafür sorgen, dass der Server automatisch konfiguriert wird. Hierbei bedeuted ```privileged: false``` dass dieses Script NICHT als Administrator (root) ausgeführt wird.
    ```ruby
    config.vm.provision "shell", path: "scripts/init.sh"
    config.vm.provision "shell", path: "scripts/mcserver_setup.sh", privileged: false
    ```

## Provisioning Scripts
Ich nutze zwei Provisioning Script. Diese liegen in dem Ordner ```Scripts```
### Das init.sh Script
Das ```init.sh``` Script updated den Server erstmals und konfiguriert die Firewall.
Danach alle wird noch die benötigte Software installiert.
### Das mcserver_setup.sh Script
Das ```mcserver_setup.sh``` startet eigentlich nur den Minecraft Server zum abschluss. (Beim ersten start muss jedoch noch die ```EULA.txt``` im Server Verzeichnis akzeptiert werden. Danach muss der Minecraft Server erneut manuell gestartet werden.)

## Minecraft Server Startdateien
Um den Minecraft Server zu starten nutze ich die Software ```Screen```. Damit wird der Minecraft Server im Hintergrund im einem Terminal gestartet und ich kann jederzeit in dieses Terminal reingeehen und auch wieder rausgehen.

Die ```start-server.sh``` Datei führt die ```run.sh``` in genau so einem ```Screen Terminal``` aus.

Die ```run.sh``` startet dann den eigentlichen Minecraft Server.