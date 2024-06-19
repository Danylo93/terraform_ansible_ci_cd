# rodar playbook no ansible
ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key ~/../../mnt/c/Users/agenc/.ssh/id_rsa

# acesso ssh maquina
ssh -i ~/.ssh/terraform-aws ubuntu@ec2-54-224-161-20.compute-1.amazonaws.com 
