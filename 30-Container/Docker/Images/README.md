Das Dockerfile enthält die folgenden Schritte:

```
FROM ubuntu:20.04
```
Dies definiert das Basisimage als offizielles Ubuntu-Image in der Version 20.04.

```
ENV TZ=Europe/Zurich  
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
```
Hier wird die Umgebungsvariable TZ auf "Europe/Zurich" gesetzt, um die Zeitzone zu definieren. Anschließend wird ein symbolischer Link auf die lokale Zeitzone erstellt und die Zeitzone in der Datei /etc/timezone gespeichert.

```
RUN apt-get update && apt-get install -y --no-install-recommends apache2 && rm -rf /var/lib/apt/lists/*
```
In diesem Schritt werden die Paketlisten aktualisiert und der Apache-Webserver wird mit dem Befehl "apt-get install" installiert. Das Flag "--no-install-recommends" sorgt dafür, dass keine empfohlenen Pakete installiert werden. Zum Schluss werden die Paketlisten mit "rm -rf /var/lib/apt/lists/*" gelöscht, um Platz zu sparen.

```
RUN rm /var/www/html/index.html
```
Dieser Befehl löscht die Standard-Webseite des Apache-Webservers, die sich unter /var/www/html/index.html befindet.

```
RUN echo '<h1>Test</h1>' > /var/www/html/index.html
```
Hier wird eine einfache Test-Webseite erstellt, indem der Text "Test" in die Datei /var/www/html/index.html geschrieben wird.

```
EXPOSE 80
```  
Dieses Statement gibt an, dass der Port 80 exponiert werden soll, damit der Webserver von anderen Containern oder dem Hostsystem aus erreichbar ist.

```
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
```
Schließlich wird der Apache-Dienst mit dem Befehl "/usr/sbin/apache2ctl -D FOREGROUND" gestartet. Das Flag "-D FOREGROUND" sorgt dafür, dass der Apache-Webserver im Vordergrund läuft und nicht als Hintergrundprozess gestartet wird.
