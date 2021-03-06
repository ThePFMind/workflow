set -e

echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list

apt-get update && apt-get install -y openssh-server

mkdir /var/run/sshd
echo 'root:screencast' | chpasswd

sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd


echo "export VISIBLE=now" >> /etc/profile
