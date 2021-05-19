# aws-elasticsearch
A project to launch AWS Instance and configure Elasticsearch
'''
1. Create a Module where actual reusable code for creating below resources :

-> 1 Bastion Server in Public Subnet
-> 1 Elastic Node Server in Private Subnet initialized by User data script to install elasticsearch service in Ubuntu machine in Autoscaling Group.
-> Bastion Server SG
-> ES Server SG 

2. End User has to update main.tf variables to create the whole infra.

Pre Requisites:

1. VPC 
2. Private Subnet
3. Public Subnet
4. Key to SSH in Bastion and Elastic Instance 