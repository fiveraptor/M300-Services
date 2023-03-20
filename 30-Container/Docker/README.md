# Docker


## Docker Desktop installieren.
1. Docker kann man [hier](https://www.docker.com/products/docker-desktop/) von der offziellen Download Webiste herunterladen. 



## Wichtige Befehle von Docker

1. `docker version`: Zeigt die installierte Docker-Version an.

2. `docker info`: Gibt Informationen über das Docker-System an, z.B. Anzahl der Container und Images, Speicherplatz usw.

3. `docker run`: Startet einen neuen Container aus einem Image. Beispiel:

Dieser Befehl startet einen neuen Container namens "mein-container" basierend auf dem "ubuntu:latest" Image und öffnet eine interaktive Shell (`-it`).

4. `docker ps`: Listet alle laufenden Container auf. Verwende `docker ps -a`, um auch beendete Container anzuzeigen.

5. `docker stop`: Stoppt einen laufenden Container. Beispiel:

6. `docker start`: Startet einen gestoppten Container. Beispiel:

7. `docker rm`: Entfernt einen Container. Beispiel:

8. `docker images`: Listet alle auf dem System verfügbaren Images auf.

9. `docker pull`: Lädt ein Image aus der Docker-Registry herunter. Beispiel:

10. `docker rmi`: Entfernt ein Image von deinem System. Beispiel:
 ```
 docker rmi nginx:latest
 ```

11. `docker exec`: Führt einen Befehl in einem laufenden Container aus. Beispiel:
 ```
 docker exec mein-container ls /var/www/html
 ```
 Dieser Befehl führt den `ls`-Befehl im Verzeichnis `/var/www/html` des Containers "mein-container" aus.

12. `docker logs`: Zeigt die Logs eines Containers an. Beispiel:
 ```
 docker logs mein-container
 ```

13. `docker build`: Erstellt ein Image aus einem Dockerfile. Beispiel:
 ```
 docker build -t mein-image:latest .
 ```
 Erstellt ein Image namens "mein-image" mit dem Tag "latest" basierend auf dem Dockerfile im aktuellen Verzeichnis (`.`).

14. `docker-compose`: Ein separater Befehl, der es ermöglicht, Multi-Container-Anwendungen über eine `docker-compose.yml`-Datei zu definieren und zu verwalten.
