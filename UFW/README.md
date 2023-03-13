# UFW Firewall - Uncomplicated Firewall
UFW heisst Uncomplicated Firewall und ist eine benutzerfreundliche Firewall-Software für Linux-Systeme. Sie bietet eine einfachere Möglichkeit, Firewall-Regeln zu konfigurieren und zu verwalten als andere Linux-Firewall-Programme wie z.B. iptables. UFW kann verwendet werden, um den eingehenden und ausgehenden Netzwerkverkehr zu steuern und die Sicherheit des Systems zu erhöhen.

## Häufig verwendete Befehle für UFW:
| Befehl | Beschreibung |
| --- | --- |
| `sudo ufw enable` | Aktiviert die UFW-Firewall und aktiviert den autostart, dass sie beim Systemstart automatisch gestartet wird. |
| `sudo ufw disable` | Deaktiviert die UFW-Firewall. |
| `sudo ufw status` | Zeigt den aktuellen Status der Firewall an und listet alle aktuellen Firewall-Regeln auf. |
| `sudo ufw allow <Port/Service>` | Öffnet einen bestimmten Port oder erlaubt einen bestimmten Dienst (z. B. HTTP, SSH) durch die Firewall. |
| `sudo ufw deny <Port/Service>` | Blockiert den Zugriff auf einen bestimmten Port oder Dienst. |
| `sudo ufw delete <Rule Number>` | Löscht eine bestimmte Regel, anhand von der Nummer der Regel. |
| `sudo ufw reset` | Setzt die Firewall auf den Standardzustand zurück. |
| `sudo ufw limit <Port>` | Begrenzt die Anzahl der Verbindungen, die auf einen bestimmten Port zugreifen können, um die Sicherheit zu erhöhen. |
| `sudo ufw allow from <IP Address>` | Erlaubt den Zugriff auf das System von einer bestimmten IP-Adresse aus. |
| `sudo ufw deny from <IP Address>` | Blockiert den Zugriff auf das System von einer bestimmten IP-Adresse aus. |

## Automatisierung der Firewall
Um nun die konfiguration der Firewall automatisch von Vagrant erledigen zu lassen, habe ich folgende Befehle zum Vagrant Provisioning hinzugefügt.
```bash
sudo apt update
sudo apt install ufw -y
sudo ufw allow 80/tcp
sudo ufw allow from 10.0.2.2 to any port 22
sudo ufw --force enable
```
### Erklärung der Befehle
Updated die Repositories von apt-get und installiert dann die UFW auf dem System. (Sollte eigentlich schon vorinstalliert sein. Aber zur sicherheit nochmal überprüfen)
```bash
sudo apt update
sudo apt install ufw -y
```
Fügt eine Firewall Regel hinzu, die allen Traffic über Port 80/TCP auf den Server erlaubt.
```bash
sudo ufw allow 80/tcp
```
Fügt eine Firewall Regel hinzu, die den Traffic über Port 22 (SSH) auf den Server erlaubt, aber nur von der IP Adresse 10.0.2.2. Das ist in diesem Fall die IP Adresse des NATs von Virtualbox.
```bash
sudo ufw allow from 10.0.2.2 to any port 22
```
Aktiviert zum Schluss die Firewall. das force braucht es, weill man normalerweise diese aktion noch zusätzlich bestätigen muss. mit force wird dies umgangen.
```bash
sudo ufw --force enable
```