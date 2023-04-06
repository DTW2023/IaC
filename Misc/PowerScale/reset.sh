#!/bin/sh

echo Delete PowerScale Cluster
ansible-playbook -i inv Delete-Virtual-Machines.yaml
echo Deploy PowerScale Cluster
ansible-playbook -i inv Deploy-Virtual-Machines.yaml