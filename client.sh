#!/bin/sh
yum update -y
yum install epel-release -y
yum install net-tools tcpdump nano -y
echo "toor" | sudo passwd root --stdin
yum install openvpn iperf3 nano -y
mv /vagrant/client.conf /etc/openvpn/server.conf