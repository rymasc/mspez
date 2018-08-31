#sudo apt-get install build-essential
#sudo apt-get install libusb-dev libreadline-dev
#sudo apt-get install python -y
#sudo apt-get install python-bs4
#sudo apt-get update
#sudo apt-get upgrade
#sudo apt-get install python-setuptools
#v="$(lsb_release -r | awk '{print $2}')"
#if [ "${v}" = 16.04 ]; then
#   sudo easy_install requests
#else
#   pip install requests
#fi

echo 'Downloading installation files ... '
python scrape.py

echo 'installing mspgcc ...'
mkdir -p /home/$USER/ti/msp430-gcc 
sudo tar xvjf mspgcc.tar.bz2 -C /home/$USER/ti/msp430-gcc --strip-components 1
sudo unzip support-files.zip 
sudo cp -a msp430-gcc-support-files/. /home/$USER/ti/msp430-gcc

echo 'mspgcc ..installed'

echo 'installing mspdebug'
sudo mkdir -p /home/$USER/mspdebug
sudo cp mspdebug.zip /home/$USER/mspdebug
cd /home/$USER/mspdebug
sudo unzip mspdebug.zip
sudo mv libmsp430.so libmsp430_32.so
sudo mv libmsp430_64.so libmsp430.so
sudo git clone https://github.com/dlbeer.com/mspdebug
cd mspdebug
sudo make
sudo make install
export LD_LIBRARY_PATH=/home/$USER/mspdebug
echo ' ok... mspdebug should be installed and it should all work now.'



sudo rm -rf support-files.zip
sudo rm -rf msp430-gcc-support-files
sudo rm mspgcc.tar.bz2



