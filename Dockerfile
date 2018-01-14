# Use official Ubuntu release
FROM ubuntu:latest

# Install CUPS
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install cups cups-pdf

# Make CUPS port available
EXPOSE 631