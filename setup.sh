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

python scrape.py

mkdir -p /home/$USER/ti/msp430-gcc 
tar xvjf mspgcc.tar.bz2 -C /home/$USER/ti/msp430-gcc --strip-components 1
unzip support-files.zip 
cp -a msp430-gcc-support-files/. /home/$USER/ti/msp430-gcc

rm -rf support-files.zip
rm -rf msp430-gcc-support-files
rm mspgcc.tar.bz2



