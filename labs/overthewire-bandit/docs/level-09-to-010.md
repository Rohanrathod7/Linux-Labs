### Objective
Extract human-readable strings from a raw binary file (`data.txt`) where the password is preceded by several `=` characters.

### Commands Used
```bash
strings data.txt | grep "==="
# Alternative:
grep -a "===" data.txt

## Core Concepts
- strings Utility Mechanics: Scans byte streams and filters for contiguous sequences of printable ASCII characters (0x20–0x7E) that meet or exceed a minimum length threshold (default 4 bytes).

- Binary vs Text Handling: Prevents dumping non-printable binary control characters to the terminal emulator.


