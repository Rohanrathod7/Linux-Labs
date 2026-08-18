```bash
bandit4@bandit:~/inhere$ file ./*
│./-file00: data
│./-file01: data
│./-file02: OpenPGP Secret Key
│./-file03: data
│./-file04: data
│./-file05: data
│./-file06: Non-ISO extended-ASCII text, with NEL line terminators
│./-file07: ASCII text
│./-file08: data
│./-file09: data

bandit4@bandit:~/inhere$ cat ./"-file07"
```
## Core Concept
**A. Magic Bytes (File Signatures)**
- Most standard file formats write a unique sequence of constant bytes 
at the very beginning of the file (offset 0):

**B. How file Identifies ASCII vs Binary (data)**
- If no known magic signature matches:

- The file command scans the first several kilobytes of the file.

- If all bytes fall within the printable ASCII range (0x20 to 0x7E) or standard whitespace control characters (\t = 0x09, \n = 0x0A, \r = 0x0D), it flags the file as ASCII text.

- If it encounters null bytes (0x00) or non-printable control characters, it flags the file as data (raw binary).
