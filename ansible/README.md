* Ansible
This folder contains ansible to provision a hub and any number of workers.

You cannot run the worker(s) on the hub node.

Right now this expects an external s3 store and postgresql database.

To use it provide a hosts file and change the settings in the files in vars.

You should have a pre-shared private key to log in to the hosts you're expecting to access or provide access mechanisms through the hosts file.

Then run all.sh or ansible-playbook main.yaml.

** Hosts example

'''
[all:vars]
ingress_url = https://hub.test.wpscloud.co.uk
shared_store_ip = 172.17.2.31
db_host = test-hub-db.calypti53pcp.eu-west-2.rds.amazonaws.com
db_name = testhub
db_user = hubdb
db_password = shadjg7ad89hjklasdfgbhjkl
s3_endpoint = s3.amazonaws.com
s3_accessKeyId = AKIAVSPH6RVLN6J
s3_secretAccessKey = RpbPHWt5ucT7PexRy+/X4F5A/Ykf
s3_bucket = test-hubdata
s3_region = eu-west-2

[hub]
1.2.3.4 ansible_user=abc private_name=hubvm.test.wpscloud.co.uk

[workers]
2.3.4.5 ansible_user=abc private_name=worker0.test.wpscloud.co.uk
2.3.4.6 ansible_user=abc private_name=worker1.test.wpscloud.co.uk
'''

** Variables

You must set all appropriate variables in vars/common.yaml, either in that file or in hosts as shown above.

vars/ldap.yaml should be setup if you'd like ldap integration.
