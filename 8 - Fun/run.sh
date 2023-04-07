#!/bin/sh
echo Deploying MineCraft -  connect to minecraft at 10.204.20.174:25565
cd mc
ansible-playbook -i inventory playbook.yaml
cd ../qk
echo Deploying Quake - connect at http://10.204.20.175
ansible-playbook -i inventory playbook.yaml
cd ..
