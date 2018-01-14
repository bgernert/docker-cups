# Use official Ubuntu release
FROM ubuntu:latest

# Install CUPS
RUN apt update
RUN apt upgrade
RUN apt install cups

# Make CUPS port available
EXPOSE 631