
kubectl create ns fio-powerscale
kubectl create -f kubeconfigs.yaml -n fio-powerscale
kubectl create -f fio_statefulset.yaml -n fio-powerscale
echo "use kubectl scale --replicas=X statefulset.apps/fio -n fio-powwerscale" to increase instances
