#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<html>
        <body>
        <h1>Rohith Sharma</h1>
        <img src="https://pbs.twimg.com/media/E1GgiDYUUAswk4R.jpg:large" width="400" height="600">
        </body>
        </html>" > /var/www/html/index.html