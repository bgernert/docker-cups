# Use official Ubuntu release
FROM ubuntu:latest

# Install CUPS
RUN apt install cups

# Make CUPS port available
EXPOSE 631