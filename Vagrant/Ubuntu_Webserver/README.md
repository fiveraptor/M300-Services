# Ubuntu Server mit Apache2 als Webserver
Hier wird ein Ubuntu Server aufgesetzt und auch Apache (Webserver) automatisiert installiert. Dazu wird auch noch das "/var/www/html" Verzeichnis von der VM mit dem "html" Verzeichnis lokal synchronisiert. Somit kann man die Websitedaten/Code lokal gespeicheret haben und auch bearbeiten. Der Vorteil an dem ist, dass ich dann die VM so viel ich will zerstören und wieder neu aufbauen kann, wobei die Websitedaten/Code bleiben und nicht gelöscht oder neu erstellt werden müssen.

## Automatisiert den Apache Webserver installieren lassen
Um den Webserver automatisiert installieren zu lassen, kann im "Vagrantfile" Bash Befehle oder auch Skripte hinterlegt werden. Hier in diesem Fall werden folgende zwei Befehle ausgeführt.
```
config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get -y install apache2 
SHELL
```

## Lokalen Ordner mit VM Ordner verknüpfen
Um einen lokalen Ordner mit der Virtuellen Maschine zu teilen, muss im "Vagrantfile" angaben dazu gemacht werden.

Mit folgendem können die beiden Ordner angegeben werden.
```
config.vm.synced_folder "html/", "/var/www/html"
```

## Web Zugriff vom lokalen PC auf die VM
Um nun auch auf den Webserver zugreifen zu können muss ein Port vom lokalen PC auf die VM weitergeleitet werden. Dies muss man auch im "Vagrantfile" angeben.
```
config.vm.network "forwarded_port", guest:80, host:8080, auto_correct: true
```
Dies bedeutet, dass der lokale Port "8080" weitergeleitet wird auf Port "80" in der VM.