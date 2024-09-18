# Use an official Python image as the base image
FROM python:3.10-slim

# Install OpenSSH server and other dependencies
RUN apt-get update && apt-get install -y \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

# Create the SSH directory and set up an SSH user
RUN mkdir /var/run/sshd

# Set up a user with passwordless sudo
RUN useradd -m -s /bin/bash user 
RUN echo 'user:password' | chpasswd

# Allow the user to login via SSH (optional: you can adjust according to your need)
RUN echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


EXPOSE 2222

# Start the SSH service and the default command will run python interpreter
CMD ["/usr/sbin/sshd", "-D"]