# Vagrant mit der AWS Amazon Cloud
Vagrant kann auch mit verschiedenen Cloud Providern verbunden werden. Zum Beispiel mit der AWS von Amazon. Um AWS mit Vagrant nutzen zu können muss noch das "vagrant-aws" Plugin installiert werden. Und die "dummy" Box lokal hinzugefügt werden.
```bash
$ vagrant plugin install vagrant-aws
```
```bash
$ vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
```

## AWS vorbereiten
1. Die Webseite [AWS Amazon](https://aws.amazon.com/de/) öffnen und ein Amazon Stammbenutzer erstellen falls noch nicht vorhanden.
   
   ![AWS_Konto](/Screenshots/Greenshot%202023-02-27%2018.06.01.png)
2. Am besten hier den Rechenzentrum Standort auf Frankfurt umstellen. Somit haben wir die schnellste Verbindung.
   **ACHTUNG je nach dem      Weschelt dieser wieder. Also darauf achten!!**

   ![RZ_Standort](/Screenshots/Greenshot%202023-02-27%2018.08.24.png)

3. Einen AWS Benutzer erstellen, womit vagrant dann auf das "EC2" zugreifen kann. Dazu oben rechts auf dein Nutzernamen klicken und dann auf "Sicherheitsanmeldeinformationen"
   
   ![Benutzer](/Screenshots/Greenshot%202023-02-28%2009.46.35.png)

4. Dann unter dem Reiter "Benutzer" einen neuen Benutzer erstellen und diesen "vagrant" nennen.

   ![Benutzer2](/Screenshots/Greenshot%202023-02-28%2009.50.05.png)

5. Diesem Benutzer müssen wir noch die "Berechtigungsrichtlinie" "AmazonEC2FullAccess" zuweisen.

   ![Benutzer3](/Screenshots/Greenshot%202023-02-28%2009.51.39.png)

6. Wieder in die EC2 Konsole wechseln. Überprüfen ob immer noch "Frankfurt" als Rechenzentrum gewählt ist.

   ![EC2](/Screenshots/Greenshot%202023-02-28%2009.54.09.png)


7. Nun muss eine Sicherheitsgruppe erstellt werden, die dann Datenverkehr über den Port 22 und Port 80 an die VM zulässt. (Damit wir uns mit SSH verbinden können und die Webseite erreichen können.)
   
   ![Sicherheitsgruppe](/Screenshots/Greenshot%202023-02-28%2009.56.17.png)

8. Unter dem Reiter "Schlüsselpaare" müssen wir noch ein solches erstellen. Hier dann "RSA" und ".pem" wählen. Nach dem erstellen muss man die Datei mit dem Private Key herunterladen. Diese Datei am besten in den Haupt-vagrant Ordner der VM speichern. Achtung aufpassen dass man keine Keys leaked und auf Github hochlädt.

   ![Schlüsselpaar](/Screenshots/Greenshot%202023-02-28%2010.00.56.png)

9. Für das Vagrantfile benötigen wir noch die Zugriff Keys für den eben erstellten "vagrant" Benutzer. Dazu wieder in die "Sicherheitsanmeldeinformationen" wechseln und dann auf den Benutzer. Dann auf den Reiter "Sicherheitsanmeldeinformationen" wechseln und ein "Zugriffsschlüssel" erstellen. Dann die beiden Keys erstmals sichern in ein Dokument.

   ![Keys](/Screenshots/Greenshot%202023-02-28%2010.06.59.png)


## Vagrantfile konfigurieren.
Im Vagrantfile müssen wir diverse angaben wie die Zugriffs Keys und das .pem Zertifikat angeben. Auch müssen wir Angaben über den Standort des Rechenzentrums und noch weitere Angaben müssen angegeben werden. Den "SESSION TOKEN" brauchen wir nicht.

Der Instanz Typ, in diesem fall "t2-micro" ist der Typ der VM. Da gibt es verschiedene mit verschiedener Leistungn und diese sind auch unterschiedlich teuer. Der "t2-micro" ist kostenlos, deshalb verwenden wir dieser.

Das "apache.sh" Script installiert hier auch noch den Webserver auf der VM. So können wir dann kontrollieren ob alles funktioniert wenn wir auf die Webseite (Öffentliche IP Der VM, sieht man in der AWS Konsole) der VM aufrufen können.

Auch wird der lokale "html" Ordner auf die VM hochgeladen. So können wir eine Website von lokal auf den Server laden.

```ruby
Vagrant.configure("2") do |config|
    config.vm.box = "dummy"
  
    config.vm.provider :aws do |aws, override|
      aws.access_key_id = ""
      aws.secret_access_key = ""
      #aws.session_token = "SESSION TOKEN"
      aws.keypair_name = "vagrant"
      aws.region = "eu-central-1"
      aws.ami = "ami-0d1ddd83282187d18"
      aws.instance_type = "t2.micro"
      aws.security_groups = "vagrant"
      override.ssh.username = "ubuntu"
      override.ssh.private_key_path = "vagrant.pem"
    end
    config.vm.synced_folder "html/", "/var/www/html"
    config.vm.provision "shell", path: "scripts/apache.sh"
  end
```