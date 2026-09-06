### Objective
Submit the password of `bandit14` to a local service listening on TCP port `30000` to retrieve the Level 15 password.

### Commands Used
```bash
# Interactive:
nc localhost 30000

# Scripted Pipeline:
cat /etc/bandit_pass/bandit14 | nc localhost 30000

```

---

## My View
```bash 
bandit14@bandit:~$ echo "aaWe*******************" | nc localhost 30000
Correct!
pbLYu*******************

bandit14@bandit:~$
```
----
