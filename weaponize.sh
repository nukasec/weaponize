#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get install -y libcurl4-openssl-dev libssl-dev jq ruby-full libcurl4-openssl-dev \
	libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev \
	build-essential libssl-dev libffi-dev python-dev-is-python2 python-setuptools libldns-dev \
	python2 python3-pip python-pip-whl python-dnspython rename whois nikto masscan dig \
	tmux tor screenfetch make ruby

echo -e "\nSetting up your .bash_profile."
cat bash_profile_new >> ~/.bash_profile
source ~/.bash_profile

echo -e "\nGetting pretty colors and vimrc"
cat vimcfg > ~/.vimrc
cat xresources >> ~/.Xresources

echo -e "\nEnabling ufw"
sudo ufw default deny
sudo ufw allow 22
sudo ufw enable

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

echo -e "\nInstalling Amass."
sudo snap install amass

echo -e "\nInstalling Aquatone"
go get github.com/michenriksen/aquatone
echo "Aquatone finished."

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

echo -e "\nInstalling CRLF Injection Scanner"
git clone https://github.com/random-robbie/CRLF-Injection-Scanner.git
cd CRLF-Injection-Scanner
pip install colored eventlet
cd ~/tools

echo -e "\nInstalling SubBrute"
git clone https://github.com/TheRook/subbrute.git
cd ~/tools

echo -e "\nInstalling S3 Bucket Checker"
mkdir s3-bucket-check
cd s3-bucket-check
wget https://gist.githubusercontent.com/random-robbie/b452cc3e1aa99cfeba764e70b5a26dc8/raw/bucket_upload.sh
wget https://gist.githubusercontent.com/random-robbie/b0c8603e55e22b21c49fd80072392873/raw//bucket_list.sh
cd ~/tools

echo -e "\nInstalling FFuF"
git clone https://github.com/ffuf/ffuf
cd ffuf
go build
cd ~/tools

echo -e "\nDownloading Seclists"
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
echo "SecLists finished."

echo -e "\nCreating custom MOTD"
sudo chmod -x /etc/update-motd.d/*
sudo mv 01-custom-motd /etc/update-motd.d/
sudo chmod +x /etc/update-motd.d/01-custom-mod

clear
echo -e "\n\n [*] Nice! You're outfitted. Everything is located in ~/tools"
echo -e "\n [!] DONT FORGET: Populate your API keys (eg. amass)\n"

ls -la
