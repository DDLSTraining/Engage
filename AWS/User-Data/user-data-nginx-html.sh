#!/bin/bash

# Install nginx
yum update -y
amazon-linux-extras install nginx1.12 -y
systemctl enable nginx.service
systemctl start nginx.service

# Variables
INDEX_FILE='/usr/share/nginx/html/index.html'
WEB_TITLE='Everybody Loves Kangaroos'

# Creating index.html file
cat > $INDEX_FILE <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <title>$WEB_TITLE</title>
  <meta charset="utf-8" />
</head>
<body class="container">
  <header><h1>$WEB_TITLE<h1></header>
  <div id="wrapper">Demonstraion site served by nginx.</div>
  <img src='https://s3-persistent.s3-ap-southeast-2.amazonaws.com/images/roo.jpg'></img>
</body>
</html>
EOF

echo "Site Created for $WEB_TITLE"
