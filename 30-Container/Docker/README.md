# Docker


## Docker Desktop installieren.




### Schritt 1: Installiere WSL 2

1. Öffne PowerShell als Administrator.
2. Führe den folgenden Befehl aus, um das WSL-Feature zu aktivieren:

```
wsl --install
```

3. Starte deinen PC neu, wenn du dazu aufgefordert wirst.

### Schritt 2: Aktualisiere auf WSL 2

1. Öffne PowerShell als Administrator.
2. Führe den folgenden Befehl aus, um die WSL-Version auf 2 zu setzen:

```
wsl --set-default-version 2
```


### Schritt 3: Installiere Docker Desktop

1. Gehe auf die offizielle Docker-Webseite und lade Docker Desktop für Windows herunter: [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)
2. Führe die heruntergeladene Datei aus und folge den Anweisungen des Installationsassistenten.
3. Starte deinen PC neu, wenn du dazu aufgefordert wirst.

### Schritt 4: Aktiviere die WSL 2-Integration in Docker Desktop

1. Öffne Docker Desktop.
2. Klicke auf das Zahnradsymbol, um die Einstellungen zu öffnen.
3. Navigiere zum Abschnitt "Resources".
4. Wähle "WSL Integration" aus der linken Seitenleiste.
5. Aktiviere die Option "Enable integration with my default WSL distro".
6. Klicke auf "Apply & Restart", um die Änderungen zu speichern und Docker Desktop neu zu starten.

Nun hast du Docker Desktop auf Windows installiert und WSL 2 aktiviert. Du kannst Docker-Container innerhalb deiner WSL 2-Distribution ausführen und verwalten.


















## Wichtige Befehle von Docker

| Befehl          | Beschreibung                                                                                               |
|----------------|------------------------------------------------------------------------------------------------------------|
| `docker version`  | Zeigt die installierte Docker-Version an.                                                                |
| `docker info`     | Gibt Informationen über das Docker-System an, z.B. Anzahl der Container und Images, Speicherplatz usw.  |
| `docker run`      | Startet einen neuen Container aus einem Image.                                                          |
| `docker ps`       | Listet alle laufenden Container auf. Verwende `docker ps -a`, um auch beendete Container anzuzeigen.       |
| `docker stop`     | Stoppt einen laufenden Container.                                                                        |
| `docker start`    | Startet einen gestoppten Container.                                                                      |
| `docker rm`       | Entfernt einen Container.                                                                                |
| `docker images`   | Listet alle auf dem System verfügbaren Images auf.                                                       |
| `docker pull`     | Lädt ein Image aus der Docker-Registry herunter.                                                         |
| `docker rmi`      | Entfernt ein Image von deinem System.                                                                    |
| `docker exec`     | Führt einen Befehl in einem laufenden Container aus.                                                      |
| `docker logs`     | Zeigt die Logs eines Containers an.                                                                      |
| `docker build`    | Erstellt ein Image aus einem Dockerfile.                                                                  |
| `docker-compose` | Ein separater Befehl, der es ermöglicht, Multi-Container-Anwendungen über eine `docker-compose.yml`-Datei zu definieren und zu verwalten. |
