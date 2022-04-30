#!/usr/bin/env bash

Help()
{
  echo "Script options: -a (--all), -t (--target), -h (--help) "
}

Test(){
	test -e /usr/bin/nmap
        if [[ "$?" == "0" ]]
        then
                echo "NMAP is installed, trying to scan network..."
        else
                echo "NMAP isn't installed, trying to install NMAP..."
                sudo apt install nmap  -y
        fi
}

All(){
        
        echo "Next hosts hass been  found on this network:"
        sudo nmap -sn -oG - 192.168.0.* | grep Up
}

Target(){
	echo "Next ports are open:"
	sudo netstat -tunlp | grep tcp
}


############################################################
VALID_ARGS=$(getopt --options hat --longoptions help,all,target -- "$@")

eval set -- "$VALID_ARGS"

while [ : ]; do
  case "$1" in
    -h | --help)
        Help
        exit
        ;;
    -a | --all)
        echo "Processing '--all' option"
	Test
	All $1
	exit
        ;;
    -t | --target)
        echo "Processing '--target' option"
        Target
        exit
        ;;
    ??*) 
    	Help 
    	break
    	;;
   
  esac
done
