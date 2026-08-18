```bash
ls -la
bandit2@bandit:~$ ls -la                                                      │
total 24                                                                      │
-rw-r-----   1 bandit3 bandit2   33 Jun 24 14:59 --spaces in this filename--  │
drwxr-xr-x   2 root    root    4096 Jun 24 14:59 .                            │
drwxr-xr-x 150 root    root    4096 Jun 24 15:02 ..                           │
-rw-r--r--   1 root    root     220 Feb 13  2026 .bash_logout                 │
-rw-r--r--   1 root    root    3851 Jun 24 14:50 .bashrc                      │
-rw-r--r--   1 root    root     807 Feb 13  2026 .profile
                     │
bandit2@bandit:~$ cat "--spaces in this filename--"                           │
error: unexpected argument '--spaces in this filename--' found                │
                                                                              │
  tip: to pass '--spaces in this filename--' as a value, use '-- --spaces in t│
his filename--'                                                               │
                                                                              │
Usage: cat [OPTION]... [FILE]...                                              │
                                                                              │
For more information, try '--help'.                                           │
bandit2@bandit:~$ cat '--spaces in this filename--'
                           │
error: unexpected argument '--spaces in this filename--' found                │
                                                                              │
  tip: to pass '--spaces in this filename--' as a value, use '-- --spaces in t│
his filename--'                                                               │
                                                                              │
Usage: cat [OPTION]... [FILE]...                                              │
                                                                              │
For more information, try '--help'.
                                           │
bandit2@bandit:~$ cat "spaces in this filename"                               │
cat: 'spaces in this filename': No such file or directory
                     │
bandit2@bandit:~$ cat 'spaces in this filename'                               │
cat: 'spaces in this filename': No such file or directory
                     │
bandit2@bandit:~$ cat spaces\ in\ this\ filename                              │
cat: 'spaces in this filename': No such file or directory
                     │
bandit2@bandit:~$ cat "spaces in this filename"                               │
cat: 'spaces in this filename': No such file or directory
                     │
bandit2@bandit:~$ cat ./"spaces in this filename"                             │
cat: './spaces in this filename': No such file or directory
                  │

## Worked
bandit2@bandit:~$ cat ./"--spaces in this filename--"                         │
7*****************  
```

### Core Concept
- Word Splitting ($IFS): By default, Bash splits command lines on spaces into separate argv elements.

- Quote / Escape Mechanics: Quotes ("" / '') and backslashes (\) suppress field splitting, passing the full string as a single argument.
