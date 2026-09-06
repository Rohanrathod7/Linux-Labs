### Objective
Extract the password from a large text file (`data.txt`) where it appears on the line containing the keyword `millionth`.

### Commands Used
```bash
grep "millionth" data.txt
# Alternative for isolating column:
awk '$1 == "millionth" {print $2}' data.txt

## Core Concepts
- grep Stream Processing: Quickly filters lines in large data sets matching exact patterns or regular expressions.

- Column Slicing (awk / cut): Separates structured tab/space-delimited records into distinct fields ($1, $2).
