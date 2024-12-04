apt-get update    
# add swap
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
# sset xfce dektop env 
apt-get upgrade
apt-get remove -y gnome-shell
apt-get autoremove -y
# Update and install XFCE4 with LightDM
sudo apt update
# Configure LightDM for automatic login
export DEBIAN_FRONTEND=noninteractive                      
apt -y install xfce4 xfce4-goodies lightdm xubuntu-default-settings
apt -y remove gdm3
dpkg-reconfigure lightdm
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual1/workspace0/last-image -s /usr/share/backgrounds/xfce/xfce-blue.jpg   
echo -e "[Seat:*]\nuser-session=xfce\nautologin-user=vagrant\nautologin-user-timeout=0\n" > /etc/lightdm/lightdm.conf.d/lightdm.conf
