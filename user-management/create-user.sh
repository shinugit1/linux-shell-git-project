#!/bin/bash
# script to create a new user
read -p "enter the username to create:" username

#check if user already exists
if id "$username" &>/dev/null; then
echo "User '$username' already exists."
else 
sudo useradd "$username"
echo "User '$username' created successfully."
fi

