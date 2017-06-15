echo "Start script run"
apt-get -qq update
echo "Source update"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

apt-get -qq update
echo "Install Node"
apt-get install -y nodejs
echo "Install Nginx"
sudo apt-get install -y nginx
echo "Configure Nginx"
sudo rm /etc/nginx/sites-enabled/default
sudo cp node-app-nginx-config /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/node-app-nginx-config /etc/nginx/sites-enabled/node-app-nginx-config
sudo service nginx restart
sudo apt-get update
sudo apt-get install -y npm
sudo npm install -g pm2
sudo pm2 start ../server.js
sudo pm2 startup systemd
sudo pm2 save
echo "End of script run"