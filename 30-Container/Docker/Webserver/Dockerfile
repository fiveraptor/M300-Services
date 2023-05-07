# Verwende ein offizielles Ubuntu-Image als Basis
FROM ubuntu:latest

# Setze den Maintainer
LABEL maintainer="Apache"

# Aktualisiere das System und installiere Apache, SSL-Zertifikate und apache2-utils
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apache2 && \
    apt-get install -y ssl-cert && \
    apt-get install -y apache2-utils

# Aktiviere notwendige Apache-Module
RUN a2enmod ssl && \
    a2enmod rewrite && \
    a2enmod headers && \
    a2ensite default-ssl

# Erstelle die Umleitungsregel für Port 80 auf 443 in einer .conf-Datei
RUN echo '<VirtualHost *:80>' > /etc/apache2/sites-available/000-default.conf && \
    echo '   ServerName localhost' >> /etc/apache2/sites-available/000-default.conf && \
    echo '   Redirect permanent / https://localhost/' >> /etc/apache2/sites-available/000-default.conf && \
    echo '</VirtualHost>' >> /etc/apache2/sites-available/000-default.conf

# Füge die Authentifizierungsanweisungen zur SSL-Konfigurationsdatei hinzu
RUN echo '<Directory /var/www/html>' >> /etc/apache2/sites-available/default-ssl.conf && \
    echo '   AuthType Basic' >> /etc/apache2/sites-available/default-ssl.conf && \
    echo '   AuthName "Restricted Content"' >> /etc/apache2/sites-available/default-ssl.conf && \
    echo '   AuthUserFile /etc/apache2/.htpasswd' >> /etc/apache2/sites-available/default-ssl.conf && \
    echo '   Require valid-user' >> /etc/apache2/sites-available/default-ssl.conf && \
    echo '</Directory>' >> /etc/apache2/sites-available/default-ssl.conf

# Setze die Umgebungsvariablen für Apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_LEVEL warn

# Erstelle notwendige Verzeichnisse
RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR

# Erstelle die .htpasswd-Datei mit Benutzername "Docker" und Passwort "Docker"
RUN htpasswd -bc /etc/apache2/.htpasswd Docker Docker

# Exponiere Ports 80 und 443
EXPOSE 80 443

# Starte den Apache-Server im Vordergrund
CMD ["/usr/sbin/apache2", "-DFOREGROUND"]
