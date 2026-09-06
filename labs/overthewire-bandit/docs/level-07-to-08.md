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

---

### 🛠️ Core Linux Commands Reference

* **`man`**: Displays the formal manual pages and documentation for any installed system command or tool.
  * *Example:* `man grep`
* **`grep`**: Searches files or standard input for lines matching a specified pattern or regular expression.
  * *Example:* `grep "millionth" data.txt`
* **`sort`**: Sorts lines of text alphabetically or numerically in ascending or descending order.
  * *Example:* `sort -n numbers.txt`
* **`uniq`**: Filters out or isolates duplicate or unique lines from pre-sorted text input.
  * *Example:* `sort data.txt | uniq -u`
* **`strings`**: Scans binary, compiled, or non-text files and extracts all readable ASCII/Unicode character sequences.
  * *Example:* `strings data.bin | grep "password"`
* **`base64`**: Encodes raw data to base64 format or decodes base64-encoded strings back to standard text.
  * *Example:* `echo "cGFzc3dvcmQ=" | base64 -d`
* **`tr`**: Translates, substitutes, or deletes specific characters from standard input.
  * *Example:* `cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'`
* **`tar`**: Archives multiple files and directories into a single bundle (`.tar`) or extracts an existing bundle.
  * *Example:* `tar -xvf archive.tar`
* **`gzip`**: Compresses single files using the DEFLATE algorithm or decompresses `.gz` files.
  * *Example:* `gzip -d data.txt.gz`
* **`bzip2`**: Compresses single files using high-ratio block sorting or decompresses `.bz2` files.
  * *Example:* `bzip2 -d data.txt.bz2`
* **`xxd`**: Generates a hex dump of a binary file or reconstructs binary data from a plaintext hex dump.
  * *Example:* `xxd -r -p dump.hex recovered_file`
