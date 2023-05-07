# MYSQL Server mit Docker
Dieses Dockerfile erstellt ein Image, worin ein MYSQL Server läuft un eine Datenbank und einen Datenbankbenutzer erstellt wird.


Hier wird das Basisimage auf der neusten Version des MySQL Images, dass auf Docker Hub ist festgelegt.
```
FROM mysql:latest
```
Hier wird eine Umgebungsvariable gesetzt, um das Passwort für den MySQL Root-Benutzer zu setzen.
```
ENV MYSQL_ROOT_PASSWORD 123456
```
Hier wird eine Umgebungsvariable gesetzt, um eine neue Datenbank mit dem Namen "mydatabase" zu erstellen.
```
ENV MYSQL_DATABASE mydatabase
```
Hier werden zwei Umgebungsvariablen gesetzt, um einen neuen MySQL Benutzer mit dem Namen "user" und dem Passwort "123456" zu erstellen. Dieser Benutzer hat Berechtigungen, auf die "mydatabase" Datenbank zuzugreifen.
```
ENV MYSQL_USER user
ENV MYSQL_PASSWORD 123456
```
Folgende Zeile öffnet den Port 3306, dass andere Anwendungen zugriff auf den Datenbank Server haben.
```
EXPOSE 3306
```
Folgende Zeile startet den MySQL-Server wenn der Container gestartet wird.
```
CMD ["mysqld"]
```
