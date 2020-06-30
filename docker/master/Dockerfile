FROM ubuntu:18.04
LABEL maintainer="somdood@medulla.duckdns.org"
LABEL version="0.1"
LABEL description="This is ubuntu image for ansible testing"
#Update
RUN apt-get update -y
# Install open-ssh
RUN apt-get install -y openssh-server less iputils-ping net-tools
#Configure openssh
RUN mkdir /var/run/sshd
RUN echo 'root:supersecretpassw0rd##' |chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN useradd -m -d /home/ansible-usr ansible-usr
RUN mkdir /home/ansible-usr/.ssh
#Make sure your public key is in same folder as Dockerfile
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1EyW9+zL4A3ZrQp+vskscJYboxAvs8bVRfCSUeBFMUibVfUXs4Kw815Z1PiVuKh9WNPfX3XaxhvlKxl6i39sXfLrqlYYVVlIOHCsskYsNco4tJa8msavOZ1vJXiLgdxCP3uENSlMSx5ZJwUblzVqkIKHOSfZPb8l8apEgbpDxMruT4bJDZ5NItRON4d1PJ1pkHuaTrQ2xtOL4TFRjIu6YPDCWmZrrdqXoFGYflrnvKnXRGh9D0XvGnkpsIonQ1Fq7HRm+kO4oROaVioc10mfhRXeX5LuqGfVxnYMwP0GkICEvFw1T58pMEYxsNRGIFHfyvjUeNT+FewQiyW0P8/y9F1ebyaIjxFEL0FExLxziFL1JHdEUVnckK043B2/nF52kVeRl5BGBtUYoBsfCMuDSZRuwMLJmHR0G9PFVPrdE9gvEQjBuiLDVUjpOdNGs/QjIC7pVBKYi/BjetA3dhfpjDM/ppqcC8qdDZrnc3a0HxPXXHTu+uzRif8KBXeUXcK0= s1120391@C02CHCH9MD6M" > /home/ansible-usr/.ssh/authorized_keys
RUN chown -R ansible-usr:ansible-usr /home/ansible-usr/.ssh
RUN chmod 700 /home/ansible-usr/.ssh
RUN chmod 640 /home/ansible-usr/.ssh/authorized_keys

# adding vagrant user as ansible-usr was not working properly
# Create and configure vagrant user
RUN useradd --create-home -s /bin/bash vagrant
WORKDIR /home/vagrant
# Configure SSH access
RUN mkdir -p /home/vagrant/.ssh
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1EyW9+zL4A3ZrQp+vskscJYboxAvs8bVRfCSUeBFMUibVfUXs4Kw815Z1PiVuKh9WNPfX3XaxhvlKxl6i39sXfLrqlYYVVlIOHCsskYsNco4tJa8msavOZ1vJXiLgdxCP3uENSlMSx5ZJwUblzVqkIKHOSfZPb8l8apEgbpDxMruT4bJDZ5NItRON4d1PJ1pkHuaTrQ2xtOL4TFRjIu6YPDCWmZrrdqXoFGYflrnvKnXRGh9D0XvGnkpsIonQ1Fq7HRm+kO4oROaVioc10mfhRXeX5LuqGfVxnYMwP0GkICEvFw1T58pMEYxsNRGIFHfyvjUeNT+FewQiyW0P8/y9F1ebyaIjxFEL0FExLxziFL1JHdEUVnckK043B2/nF52kVeRl5BGBtUYoBsfCMuDSZRuwMLJmHR0G9PFVPrdE9gvEQjBuiLDVUjpOdNGs/QjIC7pVBKYi/BjetA3dhfpjDM/ppqcC8qdDZrnc3a0HxPXXHTu+uzRif8KBXeUXcK0= s1120391@C02CHCH9MD6M" > /home/vagrant/.ssh/authorized_keys
RUN chown -R vagrant: /home/vagrant/.ssh
RUN echo -n 'vagrant:vagrant' | chpasswd

# Enable passwordless sudo for the "vagrant" user
RUN mkdir -p /etc/sudoers.d
RUN install -b -m 0440 /dev/null /etc/sudoers.d/vagrant
RUN echo 'vagrant ALL=NOPASSWD: ALL' >> /etc/sudoers.d/vagrant


EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
