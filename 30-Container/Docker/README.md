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

| Befehl          | Beschreibung                                                                                               |
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
