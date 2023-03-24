
kubectl create ns fio-powerstore
kubectl create -f kubeconfigs.yaml -n fio-powerstore
kubectl create -f fio_statefulset.yaml -n fio-powerstore
echo "use kubectl scale --replicas=X statefulset.apps/fio -n fio-powerstore" to increase instances
