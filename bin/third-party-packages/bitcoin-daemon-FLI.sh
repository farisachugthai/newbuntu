sudo apt-add-repository ppa:bitcoin/bitcoin
# fingerprint should be gpg: requesting key 8842CE5E from hkp server keyserver.ubuntu.com
#gpg: /tmp/tmpixuqu73x/trustdb.gpg: trustdb created
#gpg: key 8842CE5E: public key "Launchpad PPA for Bitcoin" imported
sudo apt-get update
sudo apt install bitcoin-qt bitcoind
# now here's how we start the node at boot
#Starting your node automatically each time your computer boots makes it easy for you to contribute to the network. The easiest way to do this is to start Bitcoin Core daemon from your crontab. To edit your crontab, run the following command:

#crontab -e

#Scroll to the bottom of the file displayed and add the following line:

#@reboot bitcoind -daemon

#Save the file and exit; the updated crontab file will be installed for you. Now Bitcoin Core daemon will be automatically started each time your reboot your computer. 
bitcoind -daemon -assumevalid=0 -txindex=1 -dbcache=2500
