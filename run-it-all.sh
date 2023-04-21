#!/bin/sh

# remove old known hosts entries to avoid man in the middle attack warnings
rm -rf /root/.ssh/known_hosts

echo -n "Started "
date
start=`date +%s`


echo "Deploy Data Domain and PPDM"
cd "4 - DPS - Part I"
sh ./run.sh
cd ..


echo "Deploy PowerStore Volume to ESX"
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
sleep 20
ansible -m ping -i inventory all
if [ $? -eq 0 ] ; then
	loop=0
	echo Guests booted
fi
done

sleep 10

echo ""
echo Deploy Kubernetes
ansible-playbook -i inventory ansible-deploy-k8s-cluster.yml
cd ..
end=`date +%s`
runtime=$((end-start2))
echo Took $runtime seconds to deploy Kubernetes


echo Deploy PowerScale
cd "5 - PowerScale Installer"
sh ./run.sh
cd ..

echo Deploy CSI Drivers
cd "6 - Deploy CSI Drivers"
sh ./run.sh
cd ..

echo Deploy CSM Observability
cd "7 - Deploy CSM Observability"
sh ./run.sh
cd ..

echo Generate some load 
cd "8 - Generate Load"
sh ./run.sh
kubectl scale --replicas=5 statefulset.apps/fio -n fio-powerscale
kubectl scale --replicas=5 statefulset.apps/fio -n fio-powerstore-ext4
cd ..

echo Deploy some Applications
cd "9 - Applications"
sh ./run.sh
cd ..


echo Protect Virtual Machines master, worker-01, worker-02, worker-03 and Kubernetes namespace minecraft
cd "10 - DPS - Part II"
sh ./run.sh
cd ..


echo -n "Finished "
end=`date +%s`
runtime=$((end-start))
echo Took $runtime seconds to deploy Data Protection
echo ""
