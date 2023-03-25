#!/bin/sh

echo firing up a load for PowerScale
cd powerscale
ansible-playbook -i inventory playbook.yaml
echo use 
echo kubectl scale --replicas=X statefulsets.apps/fio -n fio-powerscale 
echo to scale up or down I/O workloads
echo to delete use kubectl delete ns fio-powerscale
echo "------------------------------------------------------------------"
echo ""

cd ../powerstore
echo firing up a load for PowerStore
ansible-playbook -i inventory playbook.yaml
echo use 
echo kubectl scale --replicas=X statefulsets.apps/fio -n fio-powerstore 
echo to scale up or down I/O workloads
echo to delete use kubectl delete ns fio-powerstore
echo "------------------------------------------------------------------"
echo ""

cd ..