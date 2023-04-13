# martin.flint@dell.com
# for some reason I can't set the ansible_ssh_pass in inventory, or vars.yaml and use something like
# ansible_ssh_pass: "{{ lookup('env', 'DD_PASSWORD') }}"
# do I pass the setting on the ansible-playbook cli, that seems to work. I can also hard doee it, but don't really wanna do that!

ansible-playbook -i inventory playbook.yaml -e "ansible_ssh_pass=$DD_PASSWORD"