#!/bin/sh
echo ""
echo Deploying PowerScale CSI Driver
cd deploy_powerscale
ansible-playbook -i inv playbook.yaml
echo ""
cd ../deploy_powerstore
echo Deploying PowerStore CSI Driver
ansible-playbook -i inv playbook.yaml

echo Drivers installed and configured
