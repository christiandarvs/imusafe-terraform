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
mv temp_repo/best.pt temp_repo/app.py temp_repo/yolov8m.pt "$PROJECT_DIR"
rm -rf temp_repo

sudo mkdir -p "$PROJECT_DIR/annotated"
sudo chown -R ubuntu:ubuntu "$PROJECT_DIR/annotated"
sudo chmod -R 755 "$PROJECT_DIR/annotated"

# Create venv & install deps
python3 -m venv venv
source venv/bin/activate

pip install --upgrade pip setuptools wheel
pip install "fastapi[standard]" uvicorn torch torchvision ultralytics transformers[torch]

# Create systemd service
SERVICE_FILE="/etc/systemd/system/imusafe.service"

sudo bash -c "cat > $SERVICE_FILE" <<EOL
[Unit]
Description=ImuSafe FastAPI Service
After=network.target

[Service]
User=ubuntu
WorkingDirectory=$PROJECT_DIR
ExecStart=$PROJECT_DIR/venv/bin/uvicorn app:app --host 0.0.0.0 --port 8000
Restart=always
Environment="YOLO_CONFIG_DIR=/home/ubuntu/.config/Ultralytics"

[Install]
WantedBy=multi-user.target
EOL

# Enable & start service
sudo systemctl daemon-reload
sudo systemctl enable imusafe
sudo systemctl start imusafe

echo "----- DONE! -----"