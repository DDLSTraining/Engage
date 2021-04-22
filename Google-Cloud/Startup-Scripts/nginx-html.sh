#! /bin/bash
apt update
apt install -y nginx
# The following path is the nginx default site location
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <style>
    html,
    body {
      height: 100%;
      text-align: center;
    }
    img {
      max-height: 80%;
    }
  </style>
</head>
<body>
  <h1>G'Day from Eastern Grey!</h1>
  <img src="https://upload.wikimedia.org/wikipedia/commons/9/9e/Macropus_giganteus_-_Brunkerville.jpg"></img>
</body>
</html>
