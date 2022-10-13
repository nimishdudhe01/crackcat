# crackcat
A basic cli hash cracking tool which uses haiti and hashcat to crack the hash provided(it is a bit buggy at the moment, but it'll get better).

## Requirements:
- Hashcat (https://github.com/hashcat/hashcat) (sudo apt-get install hashcat)
- Haiti (https://github.com/noraj/haiti/)
- rockyou.txt Is the default wordlist to be used, You can change that easily by editing the file.

## Usage : 
$ ./crackcat <hash_to_be_cracked>
