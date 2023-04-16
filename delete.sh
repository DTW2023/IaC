#!/bin/sh


echo -n "Started "
date
start=`date +%s`

echo delete minecraft server
cd "8 - Fun/mc"
ansible-playbook -i inventory delete.yaml
cd ../..

echo delete fio workloads
cd "7 - Generate Load"
cd powerstore
echo powerstore
ansible-playbook -i inventory delete.yaml
cd ..
echo powerscale
cd powerscale
ansible-playbook -i inventory delete.yaml
cd ../..

echo wait for clean up to finish...
sleep 60

echo "Delete Virtual Machines"
cd "2 - Virtual-Machines"
ansible-playbook -i inv Delete-Virtual-Machines.yaml
cd ..

echo "Delete PowerStore Volume from ESX"
cd "1 - PowerStore_Setup"
ansible-playbook -i inv Delete-Datastore.yaml
cd ..

end=`date +%s`

# delete /root/.kube
rm -rf /root/.kube

echo -n "Finished "
date
runtime=$((end-start))
echo runtime was $runtime seconds
