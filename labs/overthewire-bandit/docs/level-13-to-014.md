### Objective
Authenticate as `bandit14` on `localhost` using the provided SSH private key (`sshkey.private`), and retrieve the password stored at `/etc/bandit_pass/bandit14`.

### Commands Used
```bash
ssh -i sshkey.private bandit14@localhost -p 2220 -o StrictHostKeyChecking=accept-new
cat /etc/bandit_pass/bandit14
```

## My View
```bash
rohan_rathod@LAPTOP-2268MDO6:~/linux-labs$ scp -P 2220 bandit13@bandit.labs.overthewire.org:~/sshkey.private ~/.ssh/bandit14.id_rsa
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

backend: gibson-1
bandit13@bandit.labs.overthewire.org's password:
sshkey.private                            100% 2602     4.4KB/s   00:00
rohan_rathod@LAPTOP-2268MDO6:~/linux-labs$ chmod 600 ~/.ssh/bandit14.id_rsa
rohan_rathod@LAPTOP-2268MDO6:~/linux-labs$ ssh-keygen -l -f ~/.ssh/bandit14.id_rsa
3072 SHA256:tWVQfRKfdtokXgHF7kkf5QFZOnnWWINbIBMby6K3cGU rudy@localhost (RSA)
rohan_rathod@LAPTOP-2268MDO6:~/linux-labs$ nano ~/.ssh/bandit14.id_rsa
rohan_rathod@LAPTOP-2268MDO6:~/linux-labs$ ssh -i ~/.ssh/bandit14.id_rsa -p 2220 bandit14@bandit.labs.overthewire.org
bandit14@bandit:~$ ls
bandit14@bandit:~$ ls -la
total 24
drwxr-xr-x   3 root root 4096 Jun 24 14:58 .
drwxr-xr-x 150 root root 4096 Jun 24 15:02 ..
-rw-r--r--   1 root root  220 Feb 13  2026 .bash_logout
-rw-r--r--   1 root root 3851 Jun 24 14:50 .bashrc
-rw-r--r--   1 root root  807 Feb 13  2026 .profile
drwxr-xr-x   2 root root 4096 Jun 24 14:58 .ssh
bandit14@bandit:~$ ls
bandit14@bandit:~$ cat /etc/bandit_pass/bandit14
aaWe********************
bandit14@bandit:~$

```
---

## Core Concepts
- Asymmetric Cryptography: Public key verifies signatures; private key remains secret on the client and signs authentication challenges.

- Strict File Permissions: OpenSSH mandates 600 permissions on private keys to protect secrets from other local users.

- Localhost Pivoting: Connecting via SSH internally across service boundaries.

---

## Technical Concept: Asymmetric Cryptography & SSH Key Pairs
- Password-based logins rely on a shared secret (both you and the server know the plaintext password or its hash). In contrast, SSH key-based authentication uses Public-Key (Asymmetric) Cryptography.

+------------------------------------+------------------------------------+
| Private Key (~/.ssh/id_rsa)        | Public Key (~/.ssh/id_rsa.pub)     |
+------------------------------------+------------------------------------+
| Kept strictly secret by the client | Placed on the server's             |
|                                    | ~/.ssh/authorized_keys             |
| Signs cryptographic challenges     | Verifies cryptographic signatures  |
+------------------------------------+------------------------------------+
### How the SSH Handshake Authenticates the Key:
- Public Key Presentation: When connecting, the client tells the server: "I want to authenticate with the key that has public fingerprint X."

- Key Lookup: The server looks inside the target user's ~/.ssh/authorized_keys. If found, it generates a random cryptographic number (nonce/challenge).

- Challenge Signing: The server sends this challenge to the client. The client uses its local Private Key to generate a cryptographic digital signature over that challenge and returns the signature to the server.

- Signature Verification: The server uses the corresponding Public Key to verify the signature. If mathematically valid, the server proves the client possesses the matching private key without the private key ever traveling across the network.
