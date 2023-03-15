# Virtual-Machines

edit vm_vars.yaml with approrpriate VM details

set environment variables VC_USERNAME & VC_PASSWORD


deply using

ansible-playbook -i inv Deploy-Virtual-Machines.yaml

delete with

ansible-playbook -i inv Delete-Virtual-Machines.yaml
