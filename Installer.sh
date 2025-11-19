#!/bin/bash
# Deathen Tool Installer for Linux

echo "====================================================="
echo "[Deathen Installer] Starting Full Environment Setup..."
echo "====================================================="

# 1. ------------------ Python Dependency Setup ------------------
echo "[*] Installing required Python packages..."
python3 -m pip install --upgrade pip
python3 -m pip install colorama requests dnspython mcstatus beautifulsoup4 python-nmap mcrcon toml

# 2. ------------------ Node.js & NPM Setup ------------------
echo "[*] Checking for Node.js installation..."
if ! command -v node &> /dev/null
then
    echo "[!] Node.js not found. Please install it manually:"
    echo "    https://nodejs.org/en/download/package-manager"
    exit 1
fi

# 3. ------------------ Install NPM Modules ------------------
echo "[*] Installing NPM packages..."
if [ -f package.json ]; then
    echo "[*] Detected package.json. Running full install..."
    npm install
else
    echo "[*] No package.json found. Installing required modules manually..."
    npm install mineflayer minecraft-protocol chalk
fi

# 4. ------------------ Java Setup ------------------
echo "[*] Checking for Java installation..."
if ! command -v java &> /dev/null
then
    echo "[!] Java not found. Please install Java (JRE or JDK)."
    echo "    Example (Debian/Ubuntu): sudo apt install default-jre"
    exit 1
fi

# 5. ------------------ Nmap Setup ------------------
echo "[*] Checking for Nmap installation..."
if ! command -v nmap &> /dev/null
then
    echo "[!] Nmap not found. Please install it manually."
    echo "    Example (Debian/Ubuntu): sudo apt install nmap"
    exit 1
fi

# 6. ------------------ Ncat Setup ------------------
echo "[*] Checking for ncat..."
if ! command -v ncat &> /dev/null
then
    echo "[!] ncat not found. Please install it manually."
    echo "    Example (Debian/Ubuntu): sudo apt install ncat"
else
    echo "[✓] ncat detected on system."
fi

# 7. ------------------ Java FakeProxy JAR Reminder ------------------
echo "[*] Reminder: If you haven't already, place your FakeProxy JAR inside the FakeProxy folder."
if ls FakeProxy/*.jar 1> /dev/null 2>&1; then
    echo "[✓] Detected FakeProxy jar file."
else
    echo "[!] No jar found in FakeProxy folder. Please add your FakeProxy jar to the 'FakeProxy' folder."
fi

echo "====================================================="
echo "[✓] Setup Complete! You can now run your Deathen Tool."
echo "====================================================="
