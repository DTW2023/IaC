edit vars.yaml


# namespace to sue
ps_namespace: "powerscale-csi"

# what to call storageclass
storage_class: "powerscale"

# name of cluster
clustername: "JARVIS"

# ip address to use
ps_endpoint: "10.204.20.161"

# allowed_nets can be a comma seperated list like this "10.204.20.0/24, 10.204.21.0/24, 192.168.0.0/16"
allowed_nets: "10.204.20.0/24"

# name of access zone
access_zone: "data1"

# ip address for access zone
az_service_ip: "10.204.20.164"

# default permissions
vol_permissions: "0777"

# use quotes?
quota_enabled: "true"

# isi path
isi_path: "/ifs/jarvis/data1/exports/vol1"

# port, default is 800
isi_port: "8080"

# got root?
root_enabled: "true"

# name of storage class
storage_class_name: "powerscale"


the following variables

ps_username, ps_password, ps_hostname, are pulled from bash shell environment variables called :

POWERSCALE_USERNAME
POWERSCALE_HOSTNAME
POWERSCALE_PASSWORD


to run:

ansible-playbook -i inv plakbook.yaml
