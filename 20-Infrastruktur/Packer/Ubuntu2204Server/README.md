# Ubuntu 22.04 Server mit vorinstalliertem Apach2 Server

## Automatisierte Einrichtung(Setup) von der Virtuellen Maschine
Dies erfolgt mit der "preseed.cfg" die im "http" Verzeichnis liegt. 

## Mithilfe von dem "init.sh" Script wird Apache2 installiert
Die Scripts die beim konfigurieren einer Box/VM ausgeführt werden liegen im Ordner "scripts". Hier wird anhand von diesem Script der Apache Server installiert und konfiguriert.

## Die "VBoxGuestAdditions.iso" muss noch vorhanden sein.
Hier ein Link zu einer Anleitung wie man diese ISO Datei bekommt. Diese Datei dann einfach in den Hauptordner von der VM legen (Neben die .json).

## Im Output Orner befindet sich nach Abschluss die fertige Vagrant Box.