#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get install -y libcurl4-openssl-dev libssl-dev jq ruby-full libcurl4-openssl-dev \
	libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev \
	build-essential libssl-dev libffi-dev python-dev python-setuptools libldns-dev \
	python3-pip python-pip-whl python-dnspython git rename

echo -e "\nSetting up your .bash_profile based on weapon_profile"
cat weapon_profile >> ~/.bash_profile
source ~/.bash_profile

echo -e "\nSetting up GitHub global variables"
echo "Github Username: "
read GHuser
echo "Github Email: "
read GHemail
git --config --global user.name "$GHuser"
git --config --global user.email $GHemail

echo -e "\nFetching python2 pip"
wget https://bootstrap.pypa.io/get-pip.py
sudo python2 get-pip.py

echo -e "\nInstalling GoLang."
sudo apt-get -y install golang

#SETUP GO PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
echo 'export GOPATH=$HOME/go' >> ~/.bash_profile
echo 'export PATH=$GOPATH/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile

echo -e "\nCreating ~/tools/ directory."
mkdir ~/tools
echo "Switching to ~/tools/directory."
cd ~/tools

echo -e "\nInstalling Chromium."
sudo snap install chromium

echo -e "\nInstalling Aquatone"
go get github.com/michenriksen/aquatone
echo "Aquatone finished."

<<FAIL
echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd ~/tools/
echo "done"
FAIL

echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
cd ~/tools/
echo "done"

echo -e "\nInstalling WPScan"
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan*
sudo gem install bundler && bundle install --without test
cd ~/tools/
echo "WPScan finished."

echo -e "\nInstalling DirSearch"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/
echo "DirSearch finished."

echo -e "\nInstalling SQLMap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools/
echo "SQLMap finished."

echo -e "\nInstalling LazyRecon"
git clone https://github.com/nahamsec/lazyrecon.git
cd ~/tools/
echo "LazyRecon finished."

echo -e "\nInstalling Nmap"
sudo apt-get -y install nmap
echo "Nmap finished."

echo "Installing MassDNS"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
echo "MassDNS finished."

echo -e "\nInstalling ASN-Lookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
pip install -r requirements.txt
cd ~/tools/
echo "ASN-Lookup finished."

echo -e "\nInstalling HTTProbe"
go get -u github.com/tomnomnom/httprobe
echo "HTTProbe finished."

echo -e "\nInstalling UnFurl"
go get -u github.com/tomnomnom/unfurl
echo "UnFurl finished."

echo -e "\nInstalling WayBackURLs"
go get github.com/tomnomnom/waybackurls
echo "WayBackURLs finished."

echo -e "\nInstalling crtndstry"
git clone https://github.com/nahamsec/crtndstry.git
echo "crtndstry finished."

echo -e "\nDownloading Seclists"
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
echo "SecLists finished."

echo -e "\n\n\n*** Nice! You're outfitted. All your goods are located in ~/tools ***\n"

ls -la
