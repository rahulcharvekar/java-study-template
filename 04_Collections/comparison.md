
# ✅ Java Map Implementations Cheat Sheet

| Feature              | `HashMap`                         | `Hashtable`                      | `LinkedHashMap`                      | `TreeMap`                          | `ConcurrentHashMap`               |
|----------------------|-----------------------------------|----------------------------------|--------------------------------------|-----------------------------------|-----------------------------------|
| **Thread-safe**      | ❌ No                             | ✅ Yes (synchronized)            | ❌ No                                | ❌ No                              | ✅ Yes (bucket-level sync)        |
| **Null Keys**        | ✅ One allowed                    | ❌ Not allowed                   | ✅ One allowed                       | ❌ Not allowed                     | ❌ Not allowed                    |
| **Null Values**      | ✅ Allowed                        | ❌ Not allowed                   | ✅ Allowed                           | ✅ Allowed                         | ❌ Not allowed                    |
| **Order Preserved**  | ❌ Unordered                      | ❌ Unordered                     | ✅ Insertion order maintained       | ✅ Sorted by key (natural/custom) | ❌ Unordered                      |
| **Performance**      | ✅ Fast (non-threaded)            | ❌ Slower due to sync            | ✅ Slightly slower than HashMap     | ⚠️ Slower (due to sorting)        | ✅ Efficient in multi-threading  |
| **Backed By**        | Array + LinkedList/Tree          | Array + LinkedList              | HashMap + Double Linked List        | Red-Black Tree                    | Segmented Hash Buckets           |
| **Fail-fast Iterator**| ✅ Yes                          | ❌ No                            | ✅ Yes                               | ✅ Yes                             | ✅ Weakly consistent             |
| **Sorting**          | ❌ No                             | ❌ No                            | ❌ No                                | ✅ Yes                             | ❌ No                             |
| **Best Use Case**    | General-purpose, fast lookups     | Legacy code needing sync        | Caching with predictable iteration  | Sorted maps, range queries        | High-concurrency environments     |

---

## 🔍 Quick Recommendations:

- **Need fast lookups & insertions (non-threaded)?** → `HashMap`
- **Need insertion order preserved?** → `LinkedHashMap`
- **Need sorted keys?** → `TreeMap`
- **Need thread-safe concurrent map?** → `ConcurrentHashMap`
- **Working with legacy code?** → `Hashtable` (not recommended for new code)

---

## 🧠 Key Notes:

- `TreeMap` uses **Red-Black Tree** for natural order or custom comparators.
- `LinkedHashMap` is great for **LRU caching** by overriding `removeEldestEntry()`.
- `ConcurrentHashMap` divides buckets into segments to allow concurrent access with minimal locking.

