```bash
bandit5@bandit:~/inhere$ find ./ -s 1033c
|find: unknown predicate `-s'

## Worked
bandit5@bandit:~/inhere$ find ./ -type f -size 1033c
|./maybehere07/.file2

bandit5@bandit:~/inhere$ file ././maybehere07/.file2
│././maybehere07/.file2: ASCII text, with very long lines (1000)

bandit5@bandit:~/inhere$ cat ././maybehere07/.file2
W*************

```
## Find cmd
