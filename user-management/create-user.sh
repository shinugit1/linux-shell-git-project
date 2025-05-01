#!/bin/bash
# Script to create a new user


# Ask for the username
read -p "Enter the username to create: " username

# Check if user already exists
if id "$username" &>/dev/null; then
    echo "❗ User '$username' already exists."
    exit 1
else
    # Create user
    if sudo useradd "$username"; then
        echo "✅ User '$username' created successfully."

        # Ask for password
        read -s -p "Enter password for '$username': " password
        echo
        echo "$username:$password" | sudo chpasswd
        echo "🔒 Password set for '$username'"

    else
        echo "❌ Failed to create user '$username'."
        exit 1
    fi
fi


