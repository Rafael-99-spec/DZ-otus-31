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
1) Между двумя виртуалками поднять vpn в режимах
- tun
- tap

###### tap
```
[root@server vagrant]# iperf3 -s
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------
Accepted connection from 10.10.10.2, port 51316
[  5] local 10.10.10.1 port 5201 connected to 10.10.10.2 port 51318
[ ID] Interval           Transfer     Bandwidth
[  5]   0.00-1.00   sec  21.6 MBytes   181 Mbits/sec                  
[  5]   1.00-2.00   sec  20.2 MBytes   169 Mbits/sec                  
[  5]   2.00-3.00   sec  22.1 MBytes   185 Mbits/sec                  
[  5]   3.00-4.00   sec  21.2 MBytes   178 Mbits/sec                  
[  5]   4.00-5.00   sec  22.3 MBytes   187 Mbits/sec                  
[  5]   5.00-6.00   sec  24.6 MBytes   206 Mbits/sec                  
[  5]   6.00-7.00   sec  22.5 MBytes   189 Mbits/sec                  
[  5]   7.00-8.01   sec  22.7 MBytes   190 Mbits/sec                  
[  5]   8.01-9.00   sec  23.2 MBytes   196 Mbits/sec                  
[  5]   9.00-10.00  sec  22.7 MBytes   190 Mbits/sec                  
[  5]  10.00-11.00  sec  22.1 MBytes   186 Mbits/sec                  
[  5]  11.00-12.00  sec  23.6 MBytes   198 Mbits/sec                  
[  5]  12.00-13.00  sec  23.5 MBytes   197 Mbits/sec                  
[  5]  13.00-14.00  sec  20.8 MBytes   175 Mbits/sec                  
[  5]  14.00-15.00  sec  19.2 MBytes   161 Mbits/sec                  
[  5]  15.00-16.00  sec  17.6 MBytes   147 Mbits/sec                  
[  5]  16.00-17.00  sec  18.6 MBytes   156 Mbits/sec                  
[  5]  17.00-18.00  sec  21.9 MBytes   183 Mbits/sec                  
[  5]  18.00-19.00  sec  21.4 MBytes   180 Mbits/sec                  
[  5]  19.00-20.00  sec  18.9 MBytes   158 Mbits/sec                  
[  5]  20.00-21.00  sec  20.4 MBytes   172 Mbits/sec                  
[  5]  21.00-22.00  sec  20.5 MBytes   172 Mbits/sec                  
[  5]  22.00-23.00  sec  21.6 MBytes   181 Mbits/sec                  
[  5]  23.00-24.00  sec  21.4 MBytes   179 Mbits/sec                  
[  5]  24.00-25.00  sec  22.8 MBytes   191 Mbits/sec                  
[  5]  25.00-26.00  sec  22.9 MBytes   192 Mbits/sec                  
[  5]  26.00-27.00  sec  22.0 MBytes   184 Mbits/sec                  
[  5]  27.00-28.00  sec  23.6 MBytes   198 Mbits/sec                  
[  5]  28.00-29.00  sec  21.6 MBytes   181 Mbits/sec                  
[  5]  29.00-30.00  sec  23.7 MBytes   199 Mbits/sec                  
[  5]  30.00-31.00  sec  21.7 MBytes   182 Mbits/sec                  
[  5]  31.00-32.01  sec  22.6 MBytes   189 Mbits/sec                  
[  5]  32.01-33.00  sec  3.46 MBytes  29.1 Mbits/sec                  
[  5]  33.00-34.00  sec  0.00 Bytes  0.00 bits/sec                  
[  5]  34.00-35.00  sec  0.00 Bytes  0.00 bits/sec                  
[  5]  35.00-36.00  sec  0.00 Bytes  0.00 bits/sec                  
[  5]  36.00-37.00  sec  0.00 Bytes  0.00 bits/sec                  
[  5]  37.00-38.00  sec  0.00 Bytes  0.00 bits/sec                  
[  5]  38.00-39.00  sec  0.00 Bytes  0.00 bits/sec                  
[  5]  39.00-40.00  sec  0.00 Bytes  0.00 bits/sec                  
[  5]  40.00-41.00  sec  0.00 Bytes  0.00 bits/sec                  
[  5]  41.00-42.00  sec  0.00 Bytes  0.00 bits/sec                  
[  5]  42.00-43.00  sec  0.00 Bytes  0.00 bits/sec                  
[  5]  43.00-44.00  sec  0.00 Bytes  0.00 bits/sec                  
[  5]  44.00-45.00  sec  0.00 Bytes  0.00 bits/sec                  
[  5]  45.00-46.00  sec   735 KBytes  6.02 Mbits/sec                  
[  5]  46.00-46.65  sec  0.00 Bytes  0.00 bits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth
[  5]   0.00-46.65  sec  0.00 Bytes  0.00 bits/sec                  sender
[  5]   0.00-46.65  sec   700 MBytes   126 Mbits/sec                  receiver
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------
```
```
[root@client vagrant]# iperf3 -c 10.10.10.1 -t 40 -i 5
Connecting to host 10.10.10.1, port 5201
[  4] local 10.10.10.2 port 51318 connected to 10.10.10.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-5.00   sec   109 MBytes   182 Mbits/sec  100    147 KBytes       
[  4]   5.00-10.00  sec   116 MBytes   194 Mbits/sec  132    163 KBytes       
[  4]  10.00-15.00  sec   109 MBytes   184 Mbits/sec  148    106 KBytes       
[  4]  15.00-20.00  sec  98.0 MBytes   164 Mbits/sec   84   94.2 KBytes       
[  4]  20.00-25.00  sec   107 MBytes   179 Mbits/sec   98    120 KBytes       
[  4]  25.00-30.00  sec   114 MBytes   191 Mbits/sec   69    157 KBytes       
[  4]  30.00-35.00  sec  47.4 MBytes  79.4 Mbits/sec   23   1.29 KBytes       
[  4]  35.00-40.01  sec  0.00 Bytes  0.00 bits/sec    2   1.29 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-40.01  sec   700 MBytes   147 Mbits/sec  656             sender
[  4]   0.00-40.01  sec   700 MBytes   147 Mbits/sec                  receiver

iperf Done.
[root@client vagrant]# 
```

###### tun

2) Поднять RAS на базе OpenVPN с клиентскими сертификатами, подключиться с локальной машины на виртуалку


