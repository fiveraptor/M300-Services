FROM google/cadvisor:latest

# Exponieren des cAdvisor-Ports
EXPOSE 8080

# Starten von cAdvisor
CMD ["/usr/bin/cadvisor", "--logtostderr", "--port=8080"]