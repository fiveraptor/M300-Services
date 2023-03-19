# Apche Website Passwort abfrage
Wer seine Website mit einem Passwort schützen will der kann dies umsetzen mit der `.htpasswd` Datei und die dazugehörigen Konfigurationen bei Apache. Hier wird ganz normal einen Webserver aufgesetzt.

## SSL und HTTP zu HTTPS Weiterleitung.
Zusätzlich wird noch `SSL` aktiviert und auch wird eine Weiterleitung von HTTP nach HTTPS eingerichtet. Das heisst man kann garnicht mehr über HTTP auf die Website zugreifen, sondern man wird automatisch auf HTTPS weitergeleitet.

## Apache Site Config
Die apache2 Site Config wird mit dem Synced Folder auf die VM hochgeladen. Hier der Inhalt der Datei `001-ssl.conf`. Hier wird die Weiterleitung festgelegt und auch die Pfade zu den SSL Zertifikaten.

```conf
<VirtualHost *:80>
    ServerName localhost
    Redirect permanent / https://localhost/
</VirtualHost>

<IfModule mod_ssl.c>
<VirtualHost *:443>
    ServerName localhost
    DocumentRoot /var/www/html

    # SSL configuration
    SSLEngine on
    SSLCertificateFile /etc/ssl/certs/ssl-cert-snakeoil.pem
    SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key

    # Other configurations (e.g. logging, access control, etc.)
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    <Directory /var/www/html>
        AuthType Basic
        AuthName "Restricted Content"
        AuthUserFile /etc/apache2/.htpasswd
        Require valid-user
    </Directory>
</VirtualHost>
</IfModule>
```

Mit folgenden Befehlen wird diese `001-ssl.conf` aktiviert und dann auch genutzt.

```bash
sudo a2ensite 001-ssl.conf
sudo a2enmod ssl
sudo a2dissite 000-default.conf
sudo a2dissite default-ssl.conf
```

## Passwort abfrage
Um nun eine Passwortabfrage einzurichten braucht Apache ein sogenannte `.htpasswd` Datei. Darin steht der Benutzer und das Passwort. Oben in der `001-ssl.conf` wird der Pfad dieser Datei angegeben und die Authentifizierung aktiviert.

Mit folgenden Befehl kann man diese `.htpasswd` generieren lassen. Somit muss man sich darum nicht selbst kümmern.
```
sudo htpasswd -b -c /etc/apache2/.htpasswd user password
```