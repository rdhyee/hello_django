#!/bin/sh
ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --private-key=.vagrant/machines/unglueit/virtualbox/private_key -u vagrant $1
