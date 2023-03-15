#!/bin/sh


echo -n "Started "
date
start=`date +%s`


echo "Delete Virtual Machines"
cd "2 - Virtual-Machines"
ansible-playbook -i inv Delete-Virtual-Machines.yaml
cd ..

echo "Delete PowerStore Volume from ESX"
cd "1 - PowerStore_Setup"
ansible-playbook -i inv Delete-Datastore.yaml
cd ..

end=`date +%s`

echo -n "Finished "
date
runtime=$((end-start))
echo runtime was $runtime seconds
