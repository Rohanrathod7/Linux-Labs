### Objective
Decode the Level 12 password stored in `data.txt`, which has all letters rotated by 13 positions (ROT13).

### Commands Used
```bash
cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
# Alternative:
tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt

----

Technical Concept: ROT13 & Character Substitution with trA. The ROT13 Caesar Cipher MechanicsROT13 ("rotate by 13 places") is a classic substitution cipher that shifts every alphabet character by 13 steps down the 26-letter Latin alphabet:$$C \equiv (P + 13) \pmod{26}$$Because $13 + 13 = 26 \equiv 0 \pmod{26}$, ROT13 is reciprocal (involutory): the exact same algorithm and key encrypt and decrypt the text. Applying ROT13 to ciphertext returns the original plaintext.Plaintext Alphabet:   A B C D E F G H I J K L M | N O P Q R S T U V W X Y Z
                      ↕ ↕ ↕ ↕ ↕ ↕ ↕ ↕ ↕ ↕ ↕ ↕ ↕ | ↕ ↕ ↕ ↕ ↕ ↕ ↕ ↕ ↕ ↕ ↕ ↕ ↕
Ciphertext Alphabet:  N O P Q R S T U V W X Y Z | A B C D E F G H I J K L M
B. How the tr Utility Works
- tr reads strictly from standard input (stdin) and maps characters byte-by-byte based on two positional character sets: SET1 and SET2.
- In tr 'A-Za-z' 'N-ZA-Mn-za-m':
  - A-Z is mapped to N-ZA-M (uppercase rotation by 13).
  - a-z is mapped to n-za-m (lowercase rotation by 13).
  - Punctuation, digits, and whitespace are not included in SET1, so tr leaves them completely untouched.

---

## Real-World Security Scenarios
### Scenario 1: Obfuscation in Malware & Living-off-the-Land (LotL)

- Attackers frequently use ROT13, XOR with a single-byte key, or simple substitution tables to hide PowerShell commands, Windows API names, or domain strings inside scripts and binaries.

- Why? Basic signature-based Antivirus (AV) and static string scanners search for obvious keywords like VirtualAlloc, WriteProcessMemory, or cmd.exe. Shifting the characters bypasses naive string filters without the overhead or scrutiny of modern crypto libraries.

### Scenario 2: Trivial Secrets in Web Frameworks & Game Assets

- Game developers and legacy client-side web apps often store answers, cheat codes, or basic unlock flags obfuscated using ROT13 or XOR to prevent ordinary users from accidentally reading them via "View Source" or browser developer tools.

- The Takeaway: Like Base64, ROT13 provides zero cryptographic protection. It is obfuscation, not encryption.

---
