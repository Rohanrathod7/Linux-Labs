```bash
bandit3@bandit:~/inhere$ ls -la
total 12
drwxr-xr-x 2 root    root    4096 Jun 24 14:59 .
drwxr-xr-x 3 root    root    4096 Jun 24 14:59 ..
-rw-r----- 1 bandit4 bandit3   33 Jun 24 14:59 ...Hiding-From-You

bandit3@bandit:~/inhere$ cat "Hiding-From-You"
cat: Hiding-From-You: No such file or directory
 
## Worked

andit3@bandit:~/inhere$ cat ./"...Hiding-From-You"
sd********************

```


## Core Concepts
- The Dotfile Convention: In Unix-like operating systems, any file or directory whose name begins with a period (.) is treated as a hidden file.

- Accidental Origin: This was not originally designed as a security feature. In early Unix, . (current directory) and .. (parent directory) were stored as regular directory entries. Ken Thompson and Dennis Ritchie wrote ls to check if filename[0] == '.' and skip it so directory listings wouldn't be cluttered with . and ... As a side effect, any file starting with . was automatically hidden by tools.

- ls Flag Mechanics:

- ls (default): Skips any entry starting with ..

- ls -a (--all): Lists every file, including ., .., and all dotfiles.

- ls -A (--almost-all): Lists all dotfiles (like .hidden, .bashrc), but omits the implied . and .. entries.
