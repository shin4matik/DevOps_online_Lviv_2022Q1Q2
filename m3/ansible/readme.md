## Install


## Connections
ssh-keys


## Configure

ansible/hosts
```
[servers]
server1  ansible_host=123.23.2.3  ansible_user=ubuntu ansible_ssh_private_key=home/ubuntu/.ssh/server1.pem
...
```
ansible/ansible.cfg
```
[defaults]
host_key_checking = false
inventory = ./hosts

```


## Playbooks
playbooks/apt.yml
```
-name: updame my ubuntu servers
    hosts: servers
    become: yes
    tasks:
    - name: apt
      apt:
        update_cache:yes
        upgrade: 'yes'
```


## Run
### First run (without playbooks)
ansible -i ./hosts servers -m ping --user ubuntu
or
ansible all -m ping

### Run playbook
ansible-playbook ./playbooks/apt.yml --user ubuntu --ask-become-pass -i ./hosts






