FROM phusion/baseimage
MAINTAINER ThePFMind <thepfmind@gmail.com>

ENV NODE_VERSION 0.12.7
ENV NPM_VERSION 2.13.3
ENV SSH_PUBLIC_KEY .ssh/pint_rsa.pub

RUN rm -f /etc/service/sshd/down
RUN echo "/usr/sbin/sshd > log &" >> /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# ## Install an SSH of your choice.
ADD $SSH_PUBLIC_KEY /tmp/id_rsa.pub
RUN cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys && rm -f /tmp/id_rsa.pub
RUN chmod 600 /root/.ssh/authorized_keys
