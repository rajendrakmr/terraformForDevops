#!/bin/bash

sudo apt-get update -y
sudo apt-get install nginx -y 
sudo systemctl start nginx

echo "<h1>This page was created through Terraform user_data</h1>" | sudo tee /var/www/html/index.html