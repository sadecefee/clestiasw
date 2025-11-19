#!/bin/bash
# Deathen Tool - Updater (Linux)

echo
echo "Updating For DeathenTool v1.4.0"
echo
sleep 2

# --- Check if Node.js (npm) is installed ---
if ! command -v npm &> /dev/null; then
    echo "[System] ✖ npm not found. Please install Node.js and npm manually."
    echo "    Example (Debian/Ubuntu): sudo apt install nodejs npm"
    exit 1
else
    echo "[System] ✔ npm is already installed."
fi

# --- Check and install additional Python modules ---
echo "Checking for Python modules..."

# Check beautifulsoup4
python3 -c "import bs4" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Installing beautifulsoup4..."
    python3 -m pip install beautifulsoup4
else
    echo "beautifulsoup4 is already installed."
fi

# Check python-nmap
python3 -c "import nmap" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Installing python-nmap..."
    python3 -m pip install python-nmap
else
    echo "python-nmap is already installed."
fi

# Check mcrcon
python3 -c "import mcrcon" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Installing mcrcon..."
    python3 -m pip install mcrcon
else
    echo "mcrcon is already installed."
fi

# --- Check and install additional Node.js modules ---
echo
echo "Checking for Node.js modules..."
echo
echo "Updating DeathenTool to v1.4.0"
# minecraft-server-util
npm list minecraft-server-util >/dev/null 2>&1
if [ $? -ne 0 ]; then
	    echo "Installing minecraft-server-util..."
	        npm install minecraft-server-util
	else
		    echo "minecraft-server-util is already installed."
fi
# Check mineflayer
npm list mineflayer >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Installing mineflayer..."
    npm install mineflayer
else
    echo "mineflayer is already installed."
fi

npm list minecraft-protocol >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Installing minecraft-protocol..."
    npm install minecraft-protocol
else
    echo "minecraft-protocol is already installed."
fi

# Check mineflayer-pathfinder
npm list mineflayer-pathfinder >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Installing mineflayer-pathfinder..."
    npm install mineflayer-pathfinder
else
    echo "mineflayer-pathfinder is already installed."
fi

# Check chalk
npm list chalk >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Installing chalk..."
    npm install chalk
else
    echo "chalk is already installed."
fi

echo
echo "Additional dependencies are up to date!"
echo
read -p "Press Enter to continue..."
clear
