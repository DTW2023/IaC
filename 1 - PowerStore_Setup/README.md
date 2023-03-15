# PowerStore_Setup

edit ps_vars.yaml with corect ip adresses, esxi hosts, etc

set environment variables VC_USERNAME, VC_PASSWORD, PS_USERNAME, and PS_PASSWORD

to deploy datastore run:

ansible-playbook -i inv Deploy-Datastore.yaml

to delete datastore run:

ansible-playbook -i inv Delete-Datastore.yaml
