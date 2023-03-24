edit vars.yaml

the following variables

ps_username, ps_password, ps_hostname, and nas_server are pulled from bash shell environment variables called :

PS_USERNAME
PS_PASSWORD
PS_HOSTNAME
PS_NASSERVER

variable "ps_id" should be the ID from yuor powerstore using powerstore GUI, go to  settings -> cluster -> Properties, you'll "Global ID" 
variable "ps_namespace" is whatever you want to call the powerstore name space the csi driver is deployed into
variable "storage_class" is what you want to call the storage class, in this case I used "powerstore-nfs"

to run:

ansible-playbook -i inv plakbook.yaml
