# Basierend auf dem offiziellen Ubuntu-Image
FROM ubuntu:20.04

# Setzen der Umgebungsvariablen für tzdata (Zeitzone)
ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Aktualisieren der Paketliste und Installation von Apache
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apache2 \
    && rm -rf /var/lib/apt/lists/*

# Entfernen der Standard-Apache-Webseite
RUN rm /var/www/html/index.html

# Erstellen einer einfachen Webseite
RUN echo '<h1>Test</h1>' > /var/www/html/index.html

# Exponieren des Apache-Ports
EXPOSE 80

# Starten des Apache-Dienstes
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
