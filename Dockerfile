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

# Copy scripts and configurations files into container
ADD start_cups /root/start_cups
ADD cupsd.conf /root/cupsd.conf

# Allow execution of start script
RUN chmod u+x /root/start_cups

# Export volumes
VOLUME /config

# Start cups
CMD ["/root/start_cups"]
