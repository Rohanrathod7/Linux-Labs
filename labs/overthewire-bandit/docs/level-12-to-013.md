### Objective
Reconstruct a binary file from a hexdump using `xxd -r`, and iteratively unpack multiple layers of compression (gzip, bzip2, tar) to retrieve the Level 13 password.

### Commands Used
```bash
mktemp -d
cp ~/data.txt .
xxd -r data.txt > payload
# Decompression loop based on `file` output:
file payload
mv payload payload.gz && gzip -d payload.gz
bzip2 -d payload
tar -xf payload
cat <final_file>
```

## My View
```bash
bandit12@bandit:~$ ls -lh
total 4.0K
-rw-r----- 1 bandit13 bandit12 2.6K Jun 24 14:58 data.txt
bandit12@bandit:~$ mktemp -d
/tmp/tmp.GnNSlqbTjF
bandit12@bandit:~$ cd /tmp/tmp.GnNSlqbTjF
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ cp ~/data.txt .
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ ls
data.txt
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ head data.txt
00000000: 1f8b 0808 a6f0 3b6a 0203 6461 7461 322e  ......;j..data2.
00000010: 6269 6e00 0144 02bb fd42 5a68 3931 4159  bin..D...BZh91AY
00000020: 2653 5904 ab91 e100 001c 7fff fffb bebf  &SY.............
00000030: f1fb dfbb be7f f57d fef5 5f8f ffcd b7b6  .......}.._.....
00000040: 19ff f6df af7f feae fff6 7fff 3001 3b6d  ............0.;m
00000050: 5b10 0000 001a 341a 34f5 000d 0068 0000  [.....4.4....h..
00000060: 0000 0683 2068 1ea0 3400 0d1e a034 19a8  .... h..4....4..
00000070: 0680 3d4d 00d0 69ea 69a6 0f54 41a0 00d1  ..=M..i.i..TA...
00000080: a034 d0c8 f506 8c86 8068 1a32 01a0 c40c  .4.......h.2....
00000090: 8323 40c8 0681 8803 4d32 1a34 0320 0000  .#@.....M2.4. ..
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ xxd -r data.txt > payload
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ file payload
payload: gzip compressed data, was "data2.bin", last modified: Wed Jun 24 14:58:46 2026, max compression, from Unix, original size modulo 2^32 580
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ mv payload payload.gz
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ gzip -d payload.gz
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ file payload
payload: bzip2 compressed data, block size = 900k
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ bzip -d payload
Command 'bzip' not found, but there are 22 similar ones.
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ bzip2 -d payload
bzip2: Can't guess original name for payload -- using payload.out
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ mv payload payload.bz2
mv: cannot stat 'payload': No such file or directory
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ bzip2 -d payload.bz2
bzip2: Can't open input file payload.bz2: No such file or directory.
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ ls
data.txt  payload.out
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ bzip2 -d payload.out
bzip2: Can't guess original name for payload.out -- using payload.out.out
bzip2: payload.out is not a bzip2 file.
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ file payload.out
payload.out: gzip compressed data, was "data4.bin", last modified: Wed Jun 24 14:58:46 2026, max compression, from Unix, original size modulo 2^32 20480
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ mv payload.out step.gz
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ ls
data.txt  step.gz
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ gzip step.gz
gzip: step.gz already has .gz suffix -- unchanged
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ gzip -d step.gz
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ ls
data.txt  step
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ cat step
data5.bin0000644000000000000000000002400015216770246011252 0ustar  rootrootdata6.bin0000644000000000000000000000033715216770246011262 0ustar  rootrootBZ2�M␦i�␦Y�=M=@҃�FF�� �dh�����$��F�F��`bƙ��D���������=l�"�3����1�� ���␦��
�ED�I���x�CI�����ѽ�)�U1�唯͘��rE8P�%��`bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ fiel step
Command 'fiel' not found, did you mean:
  command 'file' from deb file (1:5.46-5build2)
  command 'field' from deb rheolef (7.2-7build1)
Try: apt install <deb name>
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ file step
step: POSIX tar archive (GNU)
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ mv step step.tar
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ tar -xf step.tar
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ ls
data.txt  data5.bin  step.tar
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ file data5.bin
data5.bin: POSIX tar archive (GNU)
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ file payload.out
payload.out: cannot open `payload.out' (No such file or directory)
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ file step.tar
step.tar: POSIX tar archive (GNU)
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ tar -xf data5.bin
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ ls
data.txt  data5.bin  data6.bin  step.tar
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ file data6.bin
data6.bin: bzip2 compressed data, block size = 900k
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ bzip2 -d data6.bin
bzip2: Can't guess original name for data6.bin -- using data6.bin.out
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ ls
data.txt  data5.bin  data6.bin.out  step.tar
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ bzip2 -d data6.bin.out
bzip2: Can't guess original name for data6.bin.out -- using data6.bin.out.out
bzip2: data6.bin.out is not a bzip2 file.
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ ls
data.txt  data5.bin  data6.bin.out  step.tar
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ file data6.bin.out
data6.bin.out: POSIX tar archive (GNU)
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ tar -xf data.bin.out
tar: data.bin.out: Cannot open: No such file or directory
tar: Error is not recoverable: exiting now
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ ls
data.txt  data5.bin  data6.bin.out  step.tar
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ tar -xf data6.bin.out
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ ls
data.txt  data5.bin  data6.bin.out  data8.bin  step.tar
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ file data8.bin
data8.bin: gzip compressed data, was "data9.bin", last modified: Wed Jun 24 14:58:46 2026, max compression, from Unix, original size modulo 2^32 49
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ mv data8.bin data8.gz
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ gzip -d data8.gz
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ ls
data.txt  data5.bin  data6.bin.out  data8  step.tar
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ file data8
data8: ASCII text
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$ cat data8
The password is qQYQiHOBPR8zR61qxYqX45quvihF2uzk
bandit12@bandit:/tmp/tmp.GnNSlqbTjF$*****
```
----

## Core Concepts
- Hexdump Reversal (xxd -r): Converts formatted ASCII hex representations back into raw binary streams.

- Archive vs. Compression Distinction: tar packages filesystem metadata and trees into a single stream; gzip and bzip2 apply entropy reduction algorithms to individual streams.

- Header Inspection: Using file to reliably determine the next extraction utility required regardless of the current filename.

## Real-World Relevance
- Firmware Deconstruction: Analyzing multi-stage IoT images and bootloaders (similar to binwalk automation).

- Network Traffic Reconstruction: Rebuilding malware payloads extracted as hex strings from PCAP files or SIEM alerts.

----

## Real-World Security Scenarios
### Scenario 1: Forensic Carving & Firmware Unpacking

- Hardware and IoT penetration testers frequently dump flash memory chips or extract IoT firmware images (.bin).

- These firmware binaries are routinely structured as matryoshka dolls: a bootloader prepended to a compressed kernel (vmlinuz), containing an initramfs (cpio.gz), housing a compressed root filesystem (SquashFS).

- Security researchers use tools like binwalk to automate the exact file inspection and multi-layered carving sequence demonstrated manually in this level:

```Bash
binwalk -e firmware.bin
Scenario 2: Hex Payloads in SIEM Logs & PCAP Analysis
```
- Network intrusion detection systems (Snort, Suricata, Wireshark) frequently dump packet payloads as hex streams in alert logs.

- Incident responders copy the hex dump from

----

## Technical Concept: Hexdump Reversibility & Archive Formats
A. How xxd and Hex Reconstruction Work

- `xxd` dumps binary files into three text columns: Offset: HexBytes ASCII.

- `xxd -r` strips away the offset counters and ASCII representations, reads only the middle column of hexadecimal byte pairs, and writes the raw binary octets sequentially back to disk.

----

| Format | Purpose | Algorithm / Standard | Typical Magic Bytes |
| :--- | :--- | :--- | :--- |
| **`tar`** | Archiver (bundles multiple files/metadata into one stream without compressing) | POSIX UStar standard | `75 73 74 61 72` (`ustar` at offset 257) |
| **`gzip`** | Compressor (single file stream compressor) | DEFLATE algorithm | `1F 8B` |
| **`bzip2`** | Compressor (slower, higher compression ratio) | Burrows-Wheeler transform | `42 5A` (`BZ`) |
| **`xz`** | Compressor (high-ratio modern standard) | LZMA/LZMA2 | `FD 37 7A 58 5A 00` (`.7zXZ`) |
