echo "Deploy Data Domain and PPDM"
cd "4 - DPS - Part I"
sh ./run.sh
cd ..

echo Protect Virtual Machines master, worker-01, worker-02, worker-03 and Kubernetes namespace minecraft
cd "10 - DPS - Part II"
sh ./run.sh
cd ..