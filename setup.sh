#!/bin/bash
clear;
sudo apt update && sudo apt install iptables -y;
sudo iptables -F INPUT;
sudo iptables -F OUTPUT;
echo Now adding CIDR IP blocks to iptables.;
for i in `cat CIDR.txt`; do iptables -I INPUT -s $i -j DROP -w | echo $i was successfully added to iptables configuration. ; done;
echo Saving iptables configuration permanently.;
sudo iptables-save >config.log;
echo Configuration log file generated to ./config.log;
echo ALL DONE! Enjoy blocking most internet nuisances.;
