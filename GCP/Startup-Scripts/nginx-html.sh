#! /bin/bash
apt update
apt install -y nginx
# The following path is correct for Debian Buster
cat <<EOF > /var/www/html/index.nginx-debian.html
<!DOCTYPE html>
<html>
  <body>
    <h1>Hello from Mr Roo!/h1>
    <img src="https://storage.googleapis.com/rooblue-static/images/roo.jpg"></img>
    <p>This page was created from a simple startup script!</p>
  </body>
</html>
