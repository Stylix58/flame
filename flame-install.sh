#!/bin/bash

echo "Installing Flame..."
mkdir flame-inst
cd flame-inst
echo "Clone GitHub repository..."
git clone https://github.com/Stylix58/flame
cd flame
echo "Installing PyInstaller..."
pip3 install pyinstaller
echo "Compiling Flame..."
pyinstaller --onefile --name flame -- main.py
cd dist
mv ./flame ../../../flame.exec
echo "Installation finished!"
echo "WARNING: You need to change Flame of directory. You will need also to remove youself the generated files and folders."
echo "For make this task, just type in this terminal (you need to have sudo rights): sudo mv ./flame-inst/flame.exec /usr/bin/flame"
