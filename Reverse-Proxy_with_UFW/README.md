# Reverse Proxy mit Apache2 und der UFW konfiguriert
Hier habe ich einen Reverse Proxy Server und natrülich einen Webserver dazu automatisiert. Die beiden VMs sind in einem extra Netzwerk drin und haben jeweils die IP Adressen `10.0.0.10` und `10.0.0.20`.

## Mit Vagrant ein extra Netzwerk erstellen/konfigurieren
Mit folgender Zeile kann ein Netzwerk angegeben werden und die IP Adresse welche der VM zugewiesen wird.
```ruby
reverseproxy.vm.network :private_network, ip: "10.0.0.10"
```

## Proxy Server
Für den Proxy Server muss noch zusätzliche Pakete installiert werden. Man kann natürlich das `apt install ...` alles in einer Zeile schreiben. Jedoch hat dies aus welchem Grund auch immer bei mir Probleme gemacht.
```ruby
reverseproxy.vm.provision "shell", inline: <<-SHELL
    apt-get update
    sudo apt-get install apache2 -y
    sudo apt-get install ufw -y
    sudo apt-get install libapache2-mod-proxy-html -y
    sudo apt-get install libxml2-dev -y

    sudo a2enmod proxy
    sudo a2enmod proxy_html
    sudo a2enmod proxy_http

    sudo ufw allow from 10.0.2.2 to any port 22
    sudo ufw allow 80/tcp
    sudo ufw --force enable
SHELL
```

Zusätzlich wird noch das `init.sh` ausgeführt. Dies trägt noch eine Konfiguration in der Haupt apache2 Konfiguration ein.

```bash
match='# hints.'
insert='ServerName localhost'
file='/etc/apache2/apache2.conf'

sed -i "s/$match/$match\n$insert/" $file
```

Zum Schluss wird dann noch der apache2 Service neugestartet.

## Webserver
Für den Webserver muss nicht sehr viel Konfiguriert werden. Über ein Provisioning Script wird apache2 installiert und über ein Synced Folder wird meine Website die lokal im HTML Verzeichnis liegt auf die VM hochgeladen.


## Zusätzlich wird die UFW (Firewall) auch noch konfiguriert, für mehr Sicherheit
Zu all dem wurde noch die Firewall miteinbezogen. Beim deployen wird auf beiden VMs noch die Firewall (UFW) installiert, so konfiguriert, dass nur das mindeste zugelassen wird.

Hier bei dem Proxy Server
```bash
sudo apt-get -y install ufw -y
sudo ufw allow from 10.0.2.2 to any port 22
sudo ufw allow 80/tcp
sudo ufw --force enable
```

und hier bei dem Webserver
```bash
sudo apt-get -y install ufw -y
sudo ufw allow from 10.0.2.2 to any port 22
sudo ufw allow from 10.0.0.10 to any port 80
sudo ufw --force enable
```

Die Firewall lässt KEINEN Traffic direkt von aussen auf den Webserver (Auch intern im Netzwerk wird alles dichgemacht, ausser das der Proxy Server auf den Webserver zugreifen kann (intern)). Man kann nur mit dem Port 80 auf den Proxy Server zugreifen. Dieser schickt uns aber dann auf den Webserver und wir sehen unsere Webseite.