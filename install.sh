#!/bin/bash

#COLORS
#https://www.shellhacks.com/bash-colors/
RED='\e[31m'
GREEN='\e[32m'
NC='\e[0m' # No Color

LOCALPATH=$(pwd)

if [[ $(id -u) != 0 ]]; then
    echo -e "\n[!] Install.sh need to run as root or sudoer"
    exit 0
fi

echo -e "${RED}[+] Installing all requirements${NC}"
sudo apt-get update && sudo apt-get install golang gzip zip git python3-pip -y

echo -e "${RED}[+] Configuring Sublist3r${NC}"
cd $LOCALPATH/tools
git clone https://github.com/aboul3la/Sublist3r
cd Sublist3r
sudo pip3 install -r requirements.txt

echo -e "${RED}[+] Configuring subscraper${NC}"
cd $LOCALPATH/tools
git clone https://github.com/m8r0wn/subscraper
cd subscraper
sudo python3 setup.py install

echo -e "${RED}[+] Configuring assetfinder${NC}"
mkdir -p $LOCALPATH/tools/assetfinder
cd $LOCALPATH/tools/assetfinder
wget https://github.com/tomnomnom/assetfinder/releases/download/v0.1.1/assetfinder-linux-amd64-0.1.1.tgz
wait
gunzip -c assetfinder-linux-amd64-0.1.1.tgz |tar xvf -
chmod +x assetfinder
echo -e "${GREEN}[+] DONE${NC}"