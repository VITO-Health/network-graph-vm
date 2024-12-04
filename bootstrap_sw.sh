# install public/private id_rsa key if present 
if [ -f "/vagrant/id_rsa" ]; then
  echo copy id_rsa to home  
  cp /vagrant/id_rsa /home/vagrant/.ssh/
  cp /vagrant/id_rsa.pub /home/vagrant/.ssh/
  chmod 0400 /home/vagrant/.ssh/id_rsa /home/vagrant/.ssh/id_rsa.pub
  echo copy github.com to known hosts - prevent prompting git clone
  ssh-keyscan github.com > ~/.ssh/known_hosts 2>/dev/null
  cp ~/.ssh/known_hosts /home/vagrant/.ssh
  chown -R vagrant:vagrant /home/vagrant/.ssh
else
  echo Warning, put id_rsa key used to authorize working with git        
fi   
# install cytoscape
wget --no-check-certificate https://github.com/cytoscape/cytoscape/releases/download/3.10.3/Cytoscape_3_10_3_unix.sh
apt install -y openjdk-17-jdk openjdk-17-jre
chown vagrant:vagrant Cytoscape_3_10_3_unix.sh
chmod +x Cytoscape_3_10_3_unix.sh
sudo -u vagrant bash Cytoscape_3_10_3_unix.sh -q   
# install gephi software
wget --no-check-certificate https://github.com/gephi/gephi/releases/download/v0.10.1/gephi-0.10.1-linux-x64.tar.gz
tar -xzf gephi-0.10.1-linux-x64.tar.gz
echo #!/usr/bin/env xdg-open\n[Desktop Entry]\nType=Application\nName=Gephi\nExec=/home/vagrant/gephi-0.10.1/bin/gephi  %F\nIcon=/home/vagrant/gephi-0.10.1/flathub/gephi.png\nCategories=Science;\nStartupWMClass=Gephi >/home/vagrant/Desktop/Gephi.desktop
chown vagrant:vagrant -R /home/vagrant/gephi-0.10.1
chown vagrant:vagrant /home/vagrant/Desktop/Gephi.desktop
