#!/bin/bash

##********** Your environment input. *************************
## Hostname or ip address of the DataPower device 
DPHOST=INPUT_YOUR_DP_HOST_HERE

## Input the username and password:
USERNAME=INPUT_DP_USERNAME
PASSWORD=INPUTER_DP_PASSWORD

## APIC domain:
APIC_DOMAIN=INPUT_APIC_DOMAIN

## Name of gateway peering for APIC gateway service:
APIC_GW_SERVICE=INPUT_GATEWAY_PEERING_NAME



##******* Read-Only **************
## The INFILE is created then used each time the SSH connection is made to run dp commands.
INFILE=cli.txt

##************************************************************

cat << EOF > $INFILE
$USERNAME
$PASSWORD
show clock
echo sw $APIC_DOMAIN
sw $APIC_DOMAIN
co; gateway-peering-switch-primary $APIC_GW_SERVICE;
top; diag; gateway-peering-flush $APIC_GW_SERVICE; exit
y
co; apic-gw-service; admin-state disabled; exit
apic-gw-service; admin-state enabled; exit; exit

EOF


echo "Starting DRR"
	ssh  -T $DPHOST < $INFILE
	rm $INFILE
echo "Complete"