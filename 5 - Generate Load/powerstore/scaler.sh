
for i in `seq 10`; do
  kubectl scale --replicas=$i statefulsets.apps/fio -n fio-powerstore
  sleep 180
done
