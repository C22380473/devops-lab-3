#!/bin/bash

# Update package list and install necessary packages
sudo apt update && sudo apt install -y git nano vim python-is-python3 python3-venv python3-pip

# Navigate to home directory
cd ~

# Clone or update the Git repository
if [ ! -d "devops-lab-3" ]; then
    git clone https://github.com/C22380473/devops-lab-3.git devops-lab-3
else
    cd devops-lab-3
    git pull
fi

# Set up the Python virtual environment
cd ~/devops-lab-3
python3 -m venv flask_venv
source flask_venv/bin/activate

# Install Flask
pip install Flask

# Run the Flask app in the background
nohup flask --app hello run --host=0.0.0.0 --port=5000 &

echo "Flask app is running on port 5000"
