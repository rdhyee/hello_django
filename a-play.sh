#!/bin/sh
ansible-playbook -vvvv -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --private-key=.vagrant/machines/hello_django/virtualbox/private_key -u vagrant $1
