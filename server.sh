#!/bin/sh
yum update -y
yum install epel-release -y
yum install net-tools tcpdump nano -y
echo "toor" | sudo passwd root --stdin
yum install openvpn iperf3 nano -y
openvpn --genkey --secret /etc/openvpn/static.key
mv /vagrant/server.conf /etc/openvpn/server.conf
systemctl start openvpn@server
systemctl enable openvpn@server