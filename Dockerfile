# Use official Ubuntu release
FROM ubuntu:latest

# Install CUPS
RUN apt-get update && apt-get -y upgrade
RUN apt-get install cups

# Make CUPS port available
EXPOSE 631