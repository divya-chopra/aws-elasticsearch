#!/bin/bash


# Install the GPG key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -;
sudo apt-get install apt-transport-https;

# Add the repository
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list;

# Install Elastic Search 7
sudo apt-get update && sudo apt-get install elasticsearch;

sed -i '$ a network.host: ${network_host}' /etc/elasticsearch/elasticsearch.yml
sudo systemctl start elasticsearch;
sudo systemctl enable elasticsearch;
curl -X GET 'http://${network_host}:9200'