# LDAP-Anleitung

LDAP basiert auf dem Client-Server-Modell und kommt bei sogenannten Verzeichnisdiensten (Directories Services) zum Einsatz. Es beschreibt die Kommunikation zwischen dem LDAP-Client und dem Verzeichnis-(Directory-)Server. Aus einem solchen Verzeichnis können objektbezogene Daten, wie zum Beispiel Personendaten oder Rechnerkonfigurationen, ausgelesen werden. Die Kommunikation erfolgt auf Basis von Abfragen.

## Voraussetzungen

- Eine Linux-Installation (z.B. Ubuntu)
- Vagrant (https://www.vagrantup.com/)
- OpenLDAP mit UI (http://localhost:8081/phpldapadmin)
- Apache-Webserver

## Installation

1. Navigiere zum Verzeichnis "ldap".
2. Führe den Befehl `vagrant up` aus.
3. Melde dich mittels folgenden Daten an:
    - Login DN: `cn=admin,dc=nodomain`
    - Password: `admin`
4. Importiere Einträge im LDIF-Format:
    - Posix-Gruppe (entspricht Eintrag in /etc/group):
        ```
        dn: cn=apache2,dc=nodomain
        cn: apache2
        gidnumber: 500
        objectclass: posixGroup
        objectclass: top
        ```
    - Posix Account (entspricht Eintrag in /etc/passwd):
        ```
        dn: cn=Muster,cn=apache2,dc=nodomain
        cn: Muster
        gidnumber: 500
        homedirectory: /home/users/Muster
        loginshell: /bin/sh
        objectclass: inetOrgPerson
        objectclass: posixAccount
        objectclass: top
        sn: Muster
        uid: muster
        uidnumber: 1000
        userpassword: {MD5}9WGq9u8L8U1CCLtGpMyzrQ==
        ```
5. Konfiguriere den Apache-Webserver, um User/Password via LDAP zu holen:
    - Öffne die Datei `/etc/apache2/apache2.conf`.
    - Füge folgenden Code hinzu:
        ```
        <Directory /var/www/>
            Options Indexes FollowSymLinks
            AllowOverride None
            Order deny,allow
            Deny from All
            AuthName "Company.com Intranet"
            AuthType Basic
            AuthBasicProvider ldap
            AuthLDAPUrl ldap://localhost/dc=nodomain?uid
            Require valid-user
            Satisfy any
        </Directory>
        ```
6. Starte den Apache-Webserver mittels `service apache2 restart`.
7. Gehe zur URL http://localhost:8081 und melde dich mit Username `muster` und Password `xxx` am Webserver an.

## Befehle

### Ausgabe Server Informationen

