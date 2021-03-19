#!/bin/bash
ifconfig >> net1.txt                              # Gets network info, send output to file
sed -n '2p' net1.txt >> net2.txt                  # Gets 2nd line in file, output to new file
sed -n 's/        //p' net2.txt >> net3.txt       # This removes the empty space of net info
grep "nameserver" /etc/resolv.conf >> dns.txt     # This gets DNS server info
sed -n '1,3p' dns.txt >> dns2.txt                 # Removes extra DNS info
cat net3.txt dns2.txt >> ipdns.txt                # Combine net info and DNS info
mv ipdns.txt NetInfo$(date +%Y_%m_%d_%H_%M_%S).txt
mv NetInfo$(date +%Y_%m_%d_%H_%M_%S).txt /home/karnold/ServerInfo/
						  # Rename file, append timestamp to end
                                                  # The rest is removing excess files
rm net1.txt
rm net2.txt
rm net3.txt
rm dns.txt
rm dns2.txt

