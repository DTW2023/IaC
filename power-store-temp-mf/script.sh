kubectl create ns test-powerstore
sed "s/CONFIG_YAML/`cat config.yaml | base64 -w0`/g" secret.yaml | kubectl apply -f -
kubectl create -f CR.yaml
