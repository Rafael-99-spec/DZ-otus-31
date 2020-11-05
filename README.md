# ДЗ №31 Мосты, туннели и VPN
--------------------------------------------------------------------------------------------
### Домашнее задание
```
VPN
1. Между двумя виртуалками поднять vpn в режимах
- tun
- tap
Прочуствовать разницу.

2. Поднять RAS на базе OpenVPN с клиентскими сертификатами, подключиться с локальной машины на виртуалку

3*. Самостоятельно изучить, поднять ocserv и подключиться с хоста к виртуалке
```
### Практическая часть
### 1. Между двумя виртуалками поднять vpn в режимах
- tap

После разворачивания стенда из Vagrantfile была проведена диагностика скорости между vpn-сервером и vpn-клиентом через tap-интерфейсы. Результат теста отображен ниже
Server
```
[root@server vagrant]# iperf3 -s &
[1] 2663
[root@server vagrant]# -----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------
Accepted connection from 10.10.10.2, port 45606
[  5] local 10.10.10.1 port 5201 connected to 10.10.10.2 port 45608
[ ID] Interval           Transfer     Bandwidth
[  5]   0.00-1.00   sec  22.1 MBytes   185 Mbits/sec                  
[  5]   1.00-2.00   sec  22.1 MBytes   185 Mbits/sec                  
[  5]   2.00-3.00   sec  19.3 MBytes   162 Mbits/sec                  
[  5]   3.00-4.00   sec  18.7 MBytes   157 Mbits/sec                  
[  5]   4.00-5.00   sec  18.2 MBytes   153 Mbits/sec                  
[  5]   5.00-6.00   sec  17.9 MBytes   150 Mbits/sec                  
[  5]   6.00-7.00   sec  21.1 MBytes   177 Mbits/sec                  
[  5]   7.00-8.00   sec  21.0 MBytes   176 Mbits/sec                  
[  5]   8.00-9.00   sec  20.8 MBytes   174 Mbits/sec                  
[  5]   9.00-10.00  sec  21.1 MBytes   177 Mbits/sec                  
[  5]  10.00-11.00  sec  19.2 MBytes   161 Mbits/sec                  
[  5]  11.00-12.00  sec  17.5 MBytes   147 Mbits/sec                  
[  5]  12.00-13.00  sec  22.7 MBytes   190 Mbits/sec                  
[  5]  13.00-14.00  sec  22.3 MBytes   187 Mbits/sec                  
[  5]  14.00-15.00  sec  19.8 MBytes   166 Mbits/sec                  
[  5]  15.00-16.01  sec  22.2 MBytes   186 Mbits/sec                  
[  5]  16.01-17.00  sec  19.9 MBytes   168 Mbits/sec                  
[  5]  17.00-18.00  sec  19.6 MBytes   165 Mbits/sec                  
[  5]  18.00-19.00  sec  19.7 MBytes   165 Mbits/sec                  
[  5]  19.00-20.00  sec  21.3 MBytes   178 Mbits/sec                  
[  5]  20.00-21.00  sec  19.9 MBytes   167 Mbits/sec                  
[  5]  21.00-22.00  sec  20.8 MBytes   173 Mbits/sec                  
[  5]  22.00-23.00  sec  20.6 MBytes   174 Mbits/sec                  
[  5]  23.00-24.00  sec  20.2 MBytes   169 Mbits/sec                  
[  5]  24.00-25.00  sec  20.5 MBytes   172 Mbits/sec                  
[  5]  25.00-26.00  sec  19.6 MBytes   164 Mbits/sec                  
[  5]  26.00-27.00  sec  19.4 MBytes   163 Mbits/sec                  
[  5]  27.00-28.00  sec  21.2 MBytes   178 Mbits/sec                  
[  5]  28.00-29.00  sec  22.4 MBytes   188 Mbits/sec                  
[  5]  29.00-30.00  sec  18.7 MBytes   157 Mbits/sec                  
[  5]  30.00-31.00  sec  22.2 MBytes   186 Mbits/sec                  
[  5]  31.00-32.01  sec  20.3 MBytes   170 Mbits/sec                  
[  5]  32.01-33.00  sec  22.6 MBytes   191 Mbits/sec                  
[  5]  33.00-34.00  sec  22.5 MBytes   188 Mbits/sec                  
[  5]  34.00-35.00  sec  21.3 MBytes   180 Mbits/sec                  
[  5]  35.00-36.00  sec  21.8 MBytes   183 Mbits/sec                  
[  5]  36.00-37.00  sec  23.1 MBytes   194 Mbits/sec                  
[  5]  37.00-38.00  sec  22.7 MBytes   190 Mbits/sec                  
[  5]  38.00-39.00  sec  22.6 MBytes   190 Mbits/sec                  
[  5]  39.00-40.00  sec  23.5 MBytes   197 Mbits/sec                  
[  5]  40.00-40.04  sec   583 KBytes   135 Mbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth
[  5]   0.00-40.04  sec  0.00 Bytes  0.00 bits/sec                  sender
[  5]   0.00-40.04  sec   833 MBytes   175 Mbits/sec                  receiver
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------
```
Client
```
[root@client vagrant]# iperf3 -c 10.10.10.1 -t 40 -i 5
Connecting to host 10.10.10.1, port 5201
[  4] local 10.10.10.2 port 45608 connected to 10.10.10.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-5.00   sec   102 MBytes   170 Mbits/sec  123    129 KBytes       
[  4]   5.00-10.00  sec   102 MBytes   171 Mbits/sec   42    108 KBytes       
[  4]  10.00-15.00  sec   101 MBytes   170 Mbits/sec   85   91.6 KBytes       
[  4]  15.00-20.00  sec   102 MBytes   172 Mbits/sec   79   98.0 KBytes       
[  4]  20.00-25.00  sec   102 MBytes   171 Mbits/sec  122    120 KBytes       
[  4]  25.00-30.01  sec   102 MBytes   170 Mbits/sec   92    139 KBytes       
[  4]  30.01-35.00  sec   109 MBytes   182 Mbits/sec  100    155 KBytes       
[  4]  35.00-40.00  sec   114 MBytes   191 Mbits/sec   80    128 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-40.00  sec   834 MBytes   175 Mbits/sec  723             sender
[  4]   0.00-40.00  sec   833 MBytes   175 Mbits/sec                  receiver

iperf Done.
```
- tun

Для проведения аналогичного теста с tun-интерфейсами достаточно всего лишь заменить tap на tun.

Server
```
Server
[root@server vagrant]# iperf3 -s &
[1] 13254
[root@server vagrant]# -----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------
Accepted connection from 10.10.10.2, port 58932
[  5] local 10.10.10.1 port 5201 connected to 10.10.10.2 port 58934
[ ID] Interval           Transfer     Bandwidth
[  5]   0.00-1.01   sec  24.5 MBytes   204 Mbits/sec                  
[  5]   1.01-2.00   sec  24.3 MBytes   205 Mbits/sec                  
[  5]   2.00-3.00   sec  25.8 MBytes   216 Mbits/sec                  
[  5]   3.00-4.00   sec  27.0 MBytes   227 Mbits/sec                  
[  5]   4.00-5.00   sec  23.3 MBytes   196 Mbits/sec                  
[  5]   5.00-6.00   sec  21.0 MBytes   176 Mbits/sec                  
[  5]   6.00-7.00   sec  26.2 MBytes   220 Mbits/sec                  
[  5]   7.00-8.00   sec  28.2 MBytes   237 Mbits/sec                  
[  5]   8.00-9.00   sec  25.6 MBytes   215 Mbits/sec                  
[  5]   9.00-10.00  sec  26.7 MBytes   223 Mbits/sec                  
[  5]  10.00-11.00  sec  26.9 MBytes   226 Mbits/sec                  
[  5]  11.00-12.00  sec  28.5 MBytes   239 Mbits/sec                  
[  5]  12.00-13.00  sec  25.2 MBytes   211 Mbits/sec                  
[  5]  13.00-14.00  sec  25.3 MBytes   212 Mbits/sec                  
[  5]  14.00-15.00  sec  27.2 MBytes   228 Mbits/sec                  
[  5]  15.00-16.00  sec  27.7 MBytes   232 Mbits/sec                  
[  5]  16.00-17.00  sec  26.8 MBytes   225 Mbits/sec                  
[  5]  17.00-18.00  sec  26.5 MBytes   222 Mbits/sec                  
[  5]  18.00-19.00  sec  27.4 MBytes   230 Mbits/sec                  
[  5]  19.00-20.00  sec  26.6 MBytes   223 Mbits/sec                  
[  5]  20.00-21.00  sec  29.1 MBytes   244 Mbits/sec                  
[  5]  21.00-22.00  sec  28.8 MBytes   242 Mbits/sec                  
[  5]  22.00-23.00  sec  27.4 MBytes   229 Mbits/sec                  
[  5]  23.00-24.00  sec  27.7 MBytes   232 Mbits/sec                  
[  5]  24.00-25.00  sec  27.3 MBytes   229 Mbits/sec                  
[  5]  25.00-26.00  sec  26.0 MBytes   218 Mbits/sec                  
[  5]  26.00-27.00  sec  26.7 MBytes   224 Mbits/sec                  
[  5]  27.00-28.00  sec  26.7 MBytes   224 Mbits/sec                  
[  5]  28.00-29.00  sec  26.0 MBytes   218 Mbits/sec                  
[  5]  29.00-30.00  sec  26.0 MBytes   218 Mbits/sec                  
[  5]  30.00-31.00  sec  25.7 MBytes   216 Mbits/sec                  
[  5]  31.00-32.00  sec  26.0 MBytes   218 Mbits/sec                  
[  5]  32.00-33.00  sec  25.7 MBytes   216 Mbits/sec                  
[  5]  33.00-34.00  sec  27.6 MBytes   231 Mbits/sec                  
[  5]  34.00-35.00  sec  24.7 MBytes   207 Mbits/sec                  
[  5]  35.00-36.00  sec  26.8 MBytes   225 Mbits/sec                  
[  5]  36.00-37.00  sec  25.7 MBytes   216 Mbits/sec                  
[  5]  37.00-38.00  sec  27.6 MBytes   233 Mbits/sec                  
[  5]  38.00-39.00  sec  26.0 MBytes   218 Mbits/sec                  
[  5]  39.00-40.00  sec  26.5 MBytes   222 Mbits/sec                  
[  5]  40.00-40.05  sec   881 KBytes   136 Mbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth
[  5]   0.00-40.05  sec  0.00 Bytes  0.00 bits/sec                  sender
[  5]   0.00-40.05  sec  1.03 GBytes   221 Mbits/sec                  receiver
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------
```
Client
```
[root@client vagrant]# iperf3 -c 10.10.10.1 -t 40 -i 5
Connecting to host 10.10.10.1, port 5201
[  4] local 10.10.10.2 port 58934 connected to 10.10.10.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-5.00   sec   126 MBytes   212 Mbits/sec   71    123 KBytes       
[  4]   5.00-10.00  sec   128 MBytes   215 Mbits/sec  174    119 KBytes       
[  4]  10.00-15.00  sec   133 MBytes   223 Mbits/sec  123    133 KBytes       
[  4]  15.00-20.00  sec   135 MBytes   226 Mbits/sec   67    176 KBytes       
[  4]  20.00-25.00  sec   140 MBytes   235 Mbits/sec  159    104 KBytes       
[  4]  25.00-30.00  sec   131 MBytes   220 Mbits/sec  112    139 KBytes       
[  4]  30.00-35.00  sec   130 MBytes   219 Mbits/sec   81    141 KBytes       
[  4]  35.00-40.01  sec   132 MBytes   222 Mbits/sec   86    128 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-40.01  sec  1.03 GBytes   221 Mbits/sec  873             sender
[  4]   0.00-40.01  sec  1.03 GBytes   221 Mbits/sec                  receiver

iperf Done.
```
### Разница

TAP эмулирует Ethernet устройство и работает на канальном уровне модели OSI, оперируя кадрами Ethernet. TUN работает на сетевом уровне модели OSI, оперируя IP пакетами. TAP используется для создания сетевого моста, тогда как TUN для маршрутизации.

### 2. Поднять RAS на базе OpenVPN с клиентскими сертификатами, подключиться с локальной машины на виртуалку

Для выполнения данного задания можно воспользоваться Vagrantfile из 1го задания, только уберем 2й ВМ. Vagrantfile будет выглядеть следующим образом.



После запуска ВМ отключаем SELinux (setenforce 0) или создаём правило для него.
