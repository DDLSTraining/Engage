#! /bin/bash
apt update
apt install -y nginx
cat <<EOF > /usr/share/nginx/html/index.html
<html>
  <body>
    <h1>Hello from Mr Roo!/h1>
    <img src="https://storage.googleapis.com/rooblue-static/images/roo.jpg"></img>
    <p>This page was created from a simple startup script!</p>
  </body>
</html>
