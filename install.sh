#!/bin/bash

echo "Installing Flame..."
echo "Clone GitHub repository..."
git clone https://github.com/Stylix58/flame
cd flame
echo "Installing PyInstaller..."
pip3 install pyinstaller
echo "Compiling Flame..."
pyinstaller --onefile --name flame -- main.py
cd dist
mv flame ../../flame/
echo "Delete Flame's local Git repository..."
cd ../../
rm -rf ./flame/
echo "Installation finished!"
echo "WARNING: You need to change Flame of directory."
echo "For make this task, just type in this terminal (you need to have sudo rights): sudo mv flame /usr/bin/flame"
