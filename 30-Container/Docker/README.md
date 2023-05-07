# Docker


## Docker Desktop installieren.
1. Docker Desktop kann man [hier](https://www.docker.com/products/docker-desktop/) auf der offiziellen Website herunterladen.

2. Um Docker am schnellsten nutzen zu können muss auf Windows noch das `Windows Subsystem für Linux` installiert werden und dann auch auf `WSL2` geupdated werden. [Hier](https://learn.microsoft.com/de-de/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package) kann man die Update-Installationsdatei herunterladen.

3. Nach einem reboot muss aus dem Microsoft Store eine Linux Distro herunterladen und installieren. Ich empfehle `Ubuntu 22.04`. Dann kann man Ubuntu aus dem Startmenü von Windows starten.
   
4. Je nach dem muss man diese Ubuntu Ditro noch in WSL2 konvertieren. Das kann man mit folgenden Befehl in Powershell machen.
    ```powershell
    wsl --set-version Ubuntu-22.04 2
    ```

5. Nun kann man Docker Desktop installieren oder öffnen falls schon installiert öffnen.

6. Jetzt muss Docker noch dieser `Ubuntu 22.04` zugewiesen werden. Dies kann man hier machen.

    ![Docker Settings](../../Screenshots/2023-03-20%2014_14_57-Settings%20-%20Docker%20Desktop.png)

**Nun ist man bereit**

## Wichtige Befehle von Docker

| Befehl                | Beschreibung                                                                                               |
|---------------------------------|------------------------------------------------------------------------------------------------------------|
| `docker version`  | Zeigt die installierte Docker-Version an.                                                                |
| `docker info`     | Gibt Informationen über das Docker-System an, z.B. Anzahl der Container und Images, Speicherplatz usw.  |
| `docker run`      | Startet einen neuen Container aus einem Image.                                                          |
| `docker ps`       | Zeigt alle laufenden Container.       |
| `docker stop`     | Stoppt einen Container.                                                                        |
| `docker start`    | Startet einen Container.                                                                      |
| `docker rm`       | Entfernt einen Container.                                                                                |
| `docker images`   | Listet alle auf Images auf.                                                       |
| `docker pull`     | Lädt ein Image aus der Docker-Registry herunter.                                                         |
| `docker rmi`      | Entfernt ein Image von deinem System.                                                                    |
| `docker exec`     | Führt einen Befehl in einem laufenden Container aus.                                                      |
| `docker logs`     | Zeigt die Logs eines Containers an.                                                                      |
| `docker build`    | Erstellt ein Image aus einem Dockerfile.                                                                  |
| `docker-compose` | Ein separater Befehl, der es ermöglicht, Multi-Container-Anwendungen über eine `docker-compose.yml`-Datei zu definieren und zu verwalten. |


## Was ist das Dockerfile
Ein Dockerfile ist eine Textdatei, die Anweisungen enthält, um ein Docker-Image zu erstellen. Das Docker-Image enthält alle erforderlichen Abhängigkeiten, um eine Anwendung oder einen Dienst auszuführen. Das Dockerfile bietet eine Möglichkeit, Docker-Images in einer konsistenten Umgebung zu definieren und zu konfigurieren.

## Was sind Docker Images
Docker Images sind Dateien, die wie eine Art Template sind. Man kann sie aus einem Dockerfile erstellen lassen. Diese Docker Images werden dann verwendet um Container zu Deployen. Wenn man was an den Containern ändern will (Update), erstellt man auch wieder zuerst ein neues Docker Image. Dieses kann dann getestet werden und auch wieder deployt werden.

### Namensgebung:
Der Repository Name sollte klein geschrieben werden und kann aus mehreren Teilen bestehen, die durch Schrägstriche getrennt sind, ähnlich wie bei einer URL. Zum Beispiel könnte der Repository-Name "meinunternehmen/meineanwendung" lauten.

Der Tag kann eine beliebige Zeichenfolge sein, die der Entwickler wählt, um eine bestimmte Version des Images darzustellen, wie z.B. "latest" oder "v1.0".

Zusammen ergibt sich ein Docker-Image-Name wie folgt: repository-name:tag. Ein Beispiel könnte meinunternehmen/meineanwendung:v1.0 sein.

## Was sind Docker Volumes
Es gibt 3 Arten von Docker Volumes:
1. Named Volumes: Benannte Volumes sind ein benannter Speicherbereich, der von einem Docker-Container genutzt wird. Sie werden durch einen eindeutigen Namen identifiziert und sind portierbar, was bedeutet, dass sie einfach von einem Host-System auf ein anderes kopiert werden können.

2. Host-Mounted Volumes: Host-Mounted Volumes sind Verzeichnisse auf dem Host-System, die von einem Docker-Container als Volume gemountet werden. Dadurch können Daten zwischen dem Host-System und dem Container ausgetauscht werden.

3. Temporäre Volumes: Temporäre Volumes sind Volumes, die nur für die Dauer eines Container-Lebenszyklus existieren und nach dem Beenden des Containers automatisch gelöscht werden. Sie eignen sich gut für temporäre Daten, wie beispielsweise Log-Dateien oder temporäre Dateien, die während der Ausführung eines Containers generiert werden.

### Hier die Grundlegenden Befehle um Volumes zu verwenden: 
| Befehl  | Beschreibung |
| ------- | ------------ |
| `docker volume create <volume-name>` | Erstellt ein neues benanntes Volume mit dem angegebenen Namen |
| `docker volume ls` | Zeigt eine Liste aller vorhandenen Docker Volumes an |
| `docker volume inspect <volume-name>` | Zeigt Informationen über das angegebene Docker Volume an |
| `docker volume rm <volume-name>` | Entfernt das angegebene Docker Volume |
| `docker run -v <volume-name>:<container-mount-point>` | Erstellt einen neuen Container und bindet das angegebene Volume an das angegebene Verzeichnis im Container |
| `docker run -v <host-path>:<container-mount-point>` | Erstellt einen neuen Container und bindet das angegebene Host-Verzeichnis an das angegebene Verzeichnis im Container |
| `docker run --rm -v <volume-name>:<container-mount-point>` | Erstellt einen temporären Container mit dem angegebenen Volume und löscht den Container automatisch nach dem Beenden |
| `docker run --mount type=bind,source=<host-path>,target=<container-mount-point>` | Erstellt einen neuen Container und bindet das angegebene Host-Verzeichnis an das angegebene Verzeichnis im Container (Alternative zur "-v" Option) |
| `docker-compose.yml` | Verwendet die Docker Compose-Konfigurationsdatei, um Docker Volumes, Container und Netzwerke zu erstellen und zu konfigurieren. |


## Netzwerk Anbindung
Um eine Verbindung zu einem Docker-Container herzustellen, der eine bestimmte Anwendung ausführt, die auf einen bestimmten Port läuft, muss dieser Port an den Host oder das Netzwerk weitergeleitet werden. Dazu muss man im Dockerfile die Ports, die die Anwendung benutzt, über die Anweisung "EXPOSE" eintragen. Dies macht es möglich, dass andere Container oder Anwendungen auf den Container und somit auf die Anwendung zugreifen kann.

Beim starten eines Containers muss jedoch auch noch einen Parameter ```-p``` und den Ports mitgegeben werden. Hier ein Beispiel: ```docker run -p 8080:80 web```