#!/bin/bash
#Test
#Script assumes you have already set the environment variables using 'aws configure'
#Script deletes all hosted zones
#Log deleted hosted zones to a file
LOG=/home/ec2-user/deletedhostedzone`date +%Y%m%d`.log

# Get the hosted zone ids
aws route53 list-hosted-zones --output=text --query HostedZones[].Id > /tmp/hostedzone

#Delete the hosted zones

for i in `cat /tmp/hostedzone`; do echo $i >> $LOG ; aws route53 delete-hosted-zone --id $i >> $LOG ; done

#Remove the tmp file
rm -rf /tmp/hostedzone
