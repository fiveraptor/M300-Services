# Protokollieren und Überwachen

Hier wird als Basis Image das von Google Cadvisor genommen.

Dann wird der Port 8080 mit dem Befehl EXPOSE freigegeben. Das bedeutet, dass der Container auf diesem Port hört, aber jedoch wird der Port nicht direkt auf den Host freigegeben.

Nun wird dann mit dem CMD Befehl der cadvisor ausgeführt