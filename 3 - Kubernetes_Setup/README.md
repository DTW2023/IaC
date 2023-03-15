# Kubernetes_Setup
get out code with:

git clone https://github.com/DTW2023/Kubernetes_Setup.git
cd Kubernetes_setup

once you have your 4 nodes running master, worker-01, worker-02, worker-03 check ansible can connect using "ansible -m ping -i inventory all" then run the command:

ansible-playbook -i inventory ansible-deploy-k8s-cluster-v6.yml
