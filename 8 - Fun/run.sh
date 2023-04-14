#!/bin/sh
echo Deploying MineCraft -  connect to minecraft at 10.204.20.173:25565
cd mc
ansible-playbook -i inventory playbook.yaml
cd ../qk
echo Deploying Quake - connect at http://10.204.20.174
ansible-playbook -i inventory playbook.yaml
cd ..
echo Deploying Kubernetes DB - connect at http://10.204.20.175
cd db
ansible-playbook -i inv playbook.yaml
echo run command kubectl -n kubernetes-dashboard create token admin-user
cd ..


