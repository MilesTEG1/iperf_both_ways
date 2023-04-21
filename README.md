# Do an iperf3 test both ways : `iperf_both_ways.zsh` or `iperf_both_ways.sh`

Do an iperf3 test both ways in only one command.

Ths script will launch 2 tests.

- The first test will be the client (where the script is launched) uploading to the server.
- The second test will be the reverse: server uploading to the client.

## Prerequisite

- Install iperf3 on both computer/NAS;
- Launch iperf3 as a server on one machine with:

  ```shell
  iperf3 -s
  ```

## Usage

```shell
iperf_both_ways ip.adress [duration (in sec), default 20]

iperf_both_ways 1.2.3.4 35
```

- `ip.adress` is mandatory. A check will be done to verify it's validity.
- `duration` is optionnal, and it's in seconds. It's default value is 20, aka 20 seconds. (Don't put the `'s'` of the seconds unit!).

## Example

```c
~$ iperf_both_ways 192.168.2.201

192.168.2.201 est une adresse IP valide. Le test iperf3 va pouvoir s'exéctuer.
Connecting to host 192.168.2.201, port 5201
[  5] local 192.168.2.203 port 53348 connected to 192.168.2.201 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   283 MBytes  2.37 Gbits/sec    0    622 KBytes
[  5]   1.00-2.00   sec   280 MBytes  2.35 Gbits/sec    0    687 KBytes
[  5]   2.00-3.00   sec   279 MBytes  2.34 Gbits/sec    0    913 KBytes
[  5]   3.00-4.00   sec   275 MBytes  2.31 Gbits/sec    0   1.12 MBytes
[  5]   4.00-5.00   sec   280 MBytes  2.35 Gbits/sec    0   1.12 MBytes
[  5]   5.00-6.00   sec   280 MBytes  2.35 Gbits/sec    0   1.12 MBytes
[  5]   6.00-7.00   sec   281 MBytes  2.36 Gbits/sec    0   1.12 MBytes
[  5]   7.00-8.00   sec   280 MBytes  2.35 Gbits/sec    0   1.23 MBytes
[  5]   8.00-9.00   sec   279 MBytes  2.34 Gbits/sec    0   1.36 MBytes
[  5]   9.00-10.00  sec   281 MBytes  2.36 Gbits/sec    0   1.36 MBytes
[  5]  10.00-11.00  sec   275 MBytes  2.31 Gbits/sec    0   1.86 MBytes
[  5]  11.00-12.00  sec   281 MBytes  2.36 Gbits/sec    0   1.86 MBytes
[  5]  12.00-13.00  sec   279 MBytes  2.34 Gbits/sec    0   1.95 MBytes
[  5]  13.00-14.00  sec   280 MBytes  2.35 Gbits/sec    0   2.04 MBytes
[  5]  14.00-15.00  sec   281 MBytes  2.36 Gbits/sec    0   2.04 MBytes
[  5]  15.00-16.00  sec   280 MBytes  2.35 Gbits/sec    0   2.04 MBytes
[  5]  16.00-17.00  sec   280 MBytes  2.35 Gbits/sec    0   2.04 MBytes
[  5]  17.00-18.00  sec   281 MBytes  2.36 Gbits/sec    0   2.04 MBytes
[  5]  18.00-19.00  sec   279 MBytes  2.34 Gbits/sec    0   2.04 MBytes
[  5]  19.00-20.00  sec   280 MBytes  2.35 Gbits/sec    0   2.04 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-20.00  sec  5.46 GBytes  2.35 Gbits/sec    0             sender
[  5]   0.00-20.00  sec  5.46 GBytes  2.35 Gbits/sec                  receiver

iperf Done.
Connecting to host 192.168.2.201, port 5201
Reverse mode, remote host 192.168.2.201 is sending
[  5] local 192.168.2.203 port 53352 connected to 192.168.2.201 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec   277 MBytes  2.33 Gbits/sec
[  5]   1.00-2.00   sec   276 MBytes  2.32 Gbits/sec
[  5]   2.00-3.00   sec   281 MBytes  2.35 Gbits/sec
[  5]   3.00-4.00   sec   281 MBytes  2.35 Gbits/sec
[  5]   4.00-5.00   sec   279 MBytes  2.34 Gbits/sec
[  5]   5.00-6.00   sec   279 MBytes  2.34 Gbits/sec
[  5]   6.00-7.00   sec   280 MBytes  2.35 Gbits/sec
[  5]   7.00-8.00   sec   281 MBytes  2.35 Gbits/sec
[  5]   8.00-9.00   sec   279 MBytes  2.34 Gbits/sec
[  5]   9.00-10.00  sec   281 MBytes  2.35 Gbits/sec
[  5]  10.00-11.00  sec   281 MBytes  2.35 Gbits/sec
[  5]  11.00-12.00  sec   281 MBytes  2.35 Gbits/sec
[  5]  12.00-13.00  sec   281 MBytes  2.35 Gbits/sec
[  5]  13.00-14.00  sec   280 MBytes  2.35 Gbits/sec
[  5]  14.00-15.00  sec   280 MBytes  2.35 Gbits/sec
[  5]  15.00-16.00  sec   281 MBytes  2.35 Gbits/sec
[  5]  16.00-17.00  sec   281 MBytes  2.35 Gbits/sec
[  5]  17.00-18.00  sec   280 MBytes  2.35 Gbits/sec
[  5]  18.00-19.00  sec   281 MBytes  2.35 Gbits/sec
[  5]  19.00-20.00  sec   281 MBytes  2.35 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-20.00  sec  5.47 GBytes  2.35 Gbits/sec    0             sender
[  5]   0.00-20.00  sec  5.47 GBytes  2.35 Gbits/sec                  receiver

iperf Done.

```
