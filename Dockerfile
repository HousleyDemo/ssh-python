FROM python:3.10-slim

RUN apt-get update \
    && apt-get install -y openssh-server net-tools iproute2 nano \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd
RUN ssh-keygen -A

RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]