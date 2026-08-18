### Objective
- Retrieve the password stored in a file named `-` located in the home directory.

### Commands Used
```bash
ls -la
cat ./-
Alternative: cat -- -
```

### Core Concepts
- POSIX - convention: Single dash represents stdin for many standard utilities.

- Path disambiguation: Using ./- or -- forces the CLI parser to treat - as a filename rather than an option or stream identifier.
