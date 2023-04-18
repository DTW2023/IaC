
echo Deploy a DataDomain
cd DD
ansible-playbook ./playbook.yaml
echo  PPDM ova inmage and and configure it.
cd ../PPDM
ansible-playbook ./playbook.yaml
cd ..
