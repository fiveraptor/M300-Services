# Verwende das offizielle MySQL-Image als Basis
FROM mysql:latest

# Setze Umgebungsvariablen für MySQL
ENV MYSQL_ROOT_PASSWORD=mysecretpassword
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# Erstelle das Named Volume für die MySQL-Daten
VOLUME /var/lib/mysql

# Exponiere den Port für MySQL
EXPOSE 3306

# Starte den MySQL-Server
CMD ["mysqld"]
