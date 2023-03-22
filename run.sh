#!/bin/sh

# remove old known hosts entries to avoid man in the middle attack warnings
rm -rf /root/.ssh/known_hosts

echo -n "Started "
date
start=`date +%s`

echo "deploy PowerStore Volume to ESX"
cd "1 - PowerStore_Setup"
ansible-playbook -i inv Deploy-DataStore.yaml
cd ..
end=`date +%s`
runtime=$((end-start))
echo Took $runtime seconds to deploy Volume to ESXi
echo ""

sleep 2
echo ""
start1=`date +%s`
echo "Deploy Virtual Machines"
cd "2 - Virtual-Machines"
ansible-playbook -i inv Deploy-Virtual-Machines.yaml
cd ..
end=`date +%s`
runtime=$((end-start1))
echo Took $runtime seconds to deploy Virtual Machines
echo ""

sleep 2

echo ""
start2=`date +%s`
cd "3 - Kubernetes_Setup"
loop=1
echo wait for guests to boot up
while [ $loop -ne 0 ]
do
sleep 10
ansible -m ping -i inventory all
if [ $? -eq 0 ] ; then
	loop=0
	echo Guests booted
fi
done

sleep 5

echo Deploy Kubernetes
ansible-playbook -i inventory ansible-deploy-k8s-cluster.yml
cd ..
end=`date +%s`
runtime=$((end-start2))
echo Took $runtime seconds to deploy Kubernetes

echo -n "Finished "
date
runtime=$((end-start))
echo total runtime was $runtime seconds
