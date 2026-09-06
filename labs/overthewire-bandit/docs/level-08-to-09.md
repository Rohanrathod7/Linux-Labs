### Objective
Find the only line of text in `data.txt` that occurs exactly once among multiple duplicated lines.

### Commands Used
```bash
sort data.txt | uniq -u
# Alternative showing occurrence counts:
sort data.txt | uniq -c | grep " 1

Core Concepts
- uniq Single-Line Memory Model: uniq only compares adjacent lines to maintain minimal memory footprint ($O(1)$ auxiliary space); input must be pre-sorted with sort to group identical entries.
- Unix Pipes (|): Connects stdout (FD 1) of the producer process directly to stdin (FD 0) of the consumer process via an in-kernel FIFO ring buffer.Real-World Relevance

---

Unsorted Input:           Sorted Input:             uniq -u Output:
+-------------+           +-------------+           +-------------+
| Line A      |           | Line A      |           |             |
| Line B      |  sort     | Line A      |  uniq -u  |             |
| Line A      | ------->  | Line B      | --------> | Line B      |
| Line C      |           | Line C      |           | Line C      |
| Line B      |           |             |           |             |
+-------------+           +-------------+           +-------------+
