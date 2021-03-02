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
mv flame /usr/bin
echo "Finalizing installation..."
cd ../../..
mv ./flame.exec /usr/bin/flame
rm -rf ./flame-inst flame-install.sh
echo "Installation finished!"
