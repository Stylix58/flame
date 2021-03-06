#!/bin/bash

echo "Installing Flame..."
mkdir flame-inst
cd flame-inst
echo "Clone GitHub repository..."
git clone https://github.com/Stylix58/flame
cd flame
echo "Installing PyInstaller and dependanciees..."
pip3 install -r requirements.txt pyinstaller
echo "Compiling Flame..."
pyinstaller --onefile --name flame -- main.py
cd dist
sudo mv flame /usr/local/bin
echo "Finalizing installation..."
cd ../..
rm -rf ./flame-inst flame-install.sh
echo "Installation finished!"
