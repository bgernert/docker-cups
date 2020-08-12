# Use official Ubuntu release
FROM alpine:latest

# Update apk and install CUPS and CUPS-PDF
RUN apk update && \
    apk add --no-cache bash cups wget unzip rpm && \
    apk add cups-pdf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/

# Install DELL driver S282cdn/H825cdn
RUN cd /tmp && \
    wget -q https://downloads.dell.com/FOLDER03385341M/1/Printer_H825cdw_Driver_Dell_A00_Linux.zip && \
    unzip -q Printer_H825cdw_Driver_Dell_A00_Linux.zip && \
    rpm --nodeps -i S2825cdn-H825cdw/Dell-Color-MFP-S2825cdn-H825cdw-1.0-3.x86_64.rpm && \
    rm -r Printer_H825cdw_Driver_Dell_A00_Linux.zip S2825cdn-H825cdw && \
    cd

# Copy scripts and configurations files into container
ADD start_cups /root/start_cups
ADD cupsd.conf /root/cupsd.conf

# Allow execution of start script
RUN chmod u+x /root/start_cups

# Make CUPS port available
EXPOSE 631

# Export volumes
VOLUME /config

# Start cups
CMD ["/root/start_cups"]

