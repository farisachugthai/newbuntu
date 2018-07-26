#/bin/bash
# installing the cs50 library onto an Ubuntu computer
# instructions from:
#https://github.com/cs50/libcs50

sudo apt-get install software-properties-common whiptail
sudo apt-add-repository ppa:cs50/ppa
sudo apt-get update
sudo apt-get install libcs50

exit
