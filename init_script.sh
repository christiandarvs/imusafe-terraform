#!/bin/bash
set -e

# Log output
exec > >(tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1

# Update system
sudo apt update && sudo apt upgrade -y

# Install Python & dependencies
sudo apt install -y python3 python3-pip python3-venv git unzip libgl1 libglib2.0-0

# Variables
PROJECT_DIR="/home/ubuntu/imusafe-api"

# Prepare project
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

git clone https://github.com/christiandarvs/imusafe-fastapi.git temp_repo
mv temp_repo/best.pt temp_repo/app.py "$PROJECT_DIR"
rm -rf temp_repo

# Create venv & install deps
python3 -m venv venv
source venv/bin/activate

pip install --upgrade pip setuptools wheel
pip install "fastapi[standard]" uvicorn torch torchvision ultralytics

echo "----- DONE! -----"