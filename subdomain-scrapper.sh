#!/bin/bash

url=$1 #the first arguement

if [ ! -d "$url" ];then #if there is no folder called url
	   mkdir $url          #make one called url
fi

if [ ! -d "$url/recon" ];then  #if there is no directory of url/recon
	mkdir $url/recon           #make on called url/recon
fi	

echo "[+] Harvesting subdomains with our very own assetfinder"
assetfinder $url >> $url/recon/assets.txt #where we put all our subdomains

cat $url/recon/assets.txt | grep $1 >> $url/recon/final.txt 
rm $url/recon/assets.txt #removing assets.txt so we remain with final.txt