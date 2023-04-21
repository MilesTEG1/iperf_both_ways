# iperf_both_ways
Do an iperf3 test both ways in only one command.

# 

The first test will be the client (where the script is launched) uploading to the server.
# Usage

```shell
iperf_both_ways ip.adress [duration, default 20s]

iperf_both_ways 1.2.3.4 35
```

`ip.adress` is mandatory. A check will be done to verify it's validity.
`duration` is optionnal, and it's in seconds. It's default value is 20, aka 20 seconds. (Don't put the s of the seconds unit!).
