# Use official Ubuntu release
FROM ubuntu:latest

# Update Ubuntu image
RUN apt-get -qq update && apt-get -qq upgrade

# Install CUPS and CUPS-PDF
RUN apt-get -qq install cups cups-pdf

# Clean up updates/install
RUN apt-get -qq autoclean && apt-get -qq autoremove && apt-get -qq clean

# Make CUPS port available
EXPOSE 631

# Export volumes
VOLUME /config

# Start cups
CMD ["/usr/sbin/cupsd -f -C /etc/cups/cupsd.conf"]
