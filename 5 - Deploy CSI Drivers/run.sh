#!/bin/sh
echo ""

cd deploy_powerstore
echo Deploying PowerStore CSI Driver
ansible-playbook -i inv playbook.yaml

cd ..

echo Deploying PowerScale CSI Driver
cd deploy_powerscale
ansible-playbook -i inv playbook.yaml
echo ""


echo Drivers installed and configured
