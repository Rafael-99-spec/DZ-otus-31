#!/bin/sh
yum update -y
yum install epel-release -y
yum install net-tools tcpdump nano -y
echo "toor" | sudo passwd root --stdin
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
setenforce 0
yum install openvpn iperf3 nano -y
cp /vagrant/client.conf /etc/openvpn/server.conf
cp /vagrant/static.key /etc/openvpn/static.key
systemctl start openvpn@server
systemctl enable openvpn@server