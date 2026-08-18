```bash
bandit6@bandit:~$ find  / -user bandit7 -group bandit6 -type f -size 33c
##  Thousands of file saying permission denied
##  "/"  because to search whole system

bandit6@bandit:~$ find  / -user bandit7 -group bandit6 -type f -size 33c 2> /dev/null
/var/lib/dpkg/info/bandit7.password

bandit6@bandit:~$ cat /var/lib/dpkg/info/bandit7.password
****************

```
## core concept

- **/** — Starts the search recursively from the root directory of the operating system.

- **-user bandit7** — Matches files where the owner's UID resolves to the username bandit7.

- **-group bandit6** — Matches files where the GID resolves to the group bandit6.

- **-size 33c** — Matches files of exactly 33 bytes.

- **2>/dev/null** — Redirects File Descriptor 2 (stderr) to /dev/null (the bit bucket), leaving only clean matches printed to stdout.

----

Redirection Syntax Reference:

- **2>/dev/null** — Discards error messages only.

- **1>output.txt (or >output.txt)** — Redirects standard output to a file.

- **&>/dev/null (or >/dev/null 2>&1)** — Discards both standard output and standard errors simultaneously.
