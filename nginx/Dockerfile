FROM phusion/passenger-customizable
MAINTAINER ThePFMind <thepfmind@gmail.com>

## SSHD
# Install an SSH of your choice.
RUN rm -f /etc/service/sshd/down
RUN echo "/usr/sbin/sshd > log &" >> /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# change root pwd
RUN echo 'root:root' | chpasswd

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# If you're using the 'customizable' variant, you need to explicitly opt-in
# for features. Uncomment the features you want:
#
#   Build system and git.
#RUN /pd_build/utilities.sh
#   Ruby support.
#RUN /pd_build/ruby1.9.sh
#RUN /pd_build/ruby2.0.sh
#RUN /pd_build/ruby2.1.sh
#RUN /pd_build/ruby2.2.sh
#RUN /pd_build/jruby9.0.sh
#   Python support.
#RUN /pd_build/python.sh
#   Node.js and Meteor support.
#RUN /pd_build/nodejs.sh

# ...put your own build instructions here...
RUN rm -f /etc/service/nginx/down

COPY nginx.conf /etc/nginx/nginx.conf

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

