# Webserver

Dieses Dockerfile erstellt einen Docker Container, der einen Apache-Webserver mit SSL und Authentifizierung erstellt. Es wird das offizielle Ubuntu-Image genutzt.

Das Dockerfile aktiviert dann notwendigen Apache-Module SSL, Rewrite und Headers.

Als nächstes fügt der Code die Authentifizierungsanweisungen zur SSL-Konfigurationsdatei hinzu und erstellt eine .htpasswd-Datei für die Authentifizierung. Der Benutzername "Docker" und das Passwort "Docker" werden als Beispieldaten in der .htpasswd-Datei verwendet.

Das Dockerfile definiert auch Umgebungsvariablen für den Apache-Server: den Benutzer und die Gruppe die Apache ausführen soll

Schließlich werden die Ports 80 und 443 für die Kommunikation mit dem Docker-Container freigegeben und der Apache-Server gestartet.

Aucgh wird der Port 80 auf Port 443 weitergeleitet. Die Umleitung erfolgt in einer .conf-Datei, die anhand mit dem Dockerfile erstellt wird und sich im Verzeichnis "/etc/apache2/sites-available" befindet.
```
<VirtualHost *:80>
   ServerName localhost
   Redirect permanent / https://localhost/
</VirtualHost>
```