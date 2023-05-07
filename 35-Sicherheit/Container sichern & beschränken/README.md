# Container sichern und beschränken

Es handelt sich um eine einfache Flask-Anwendung, die in einem Docker-Container ausgeführt wird. Dabei gibt es das Dockerfile und die app.py.
Der Docker wird mit einen nicht root Benutzer betrieben, was die Sicherheit erhöht. Auch wird nur der Port Expost, der auch nur benötigt wird.
Zusammen erstellt der Docker-Container eine Flask-Anwendung mit einer einzigen Route für die Wurzel-URL, die den Text "Hello, World!" zurückgibt. Der Container läuft als ein nicht-root-Benutzer, was die Sicherheit verbessert.