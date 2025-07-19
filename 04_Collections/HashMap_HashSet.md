
# Java HashMap & HashSet Interview Notes

## ✅ What is a HashSet?
A `HashSet` is a collection that contains **only unique elements**, backed internally by a `HashMap`.

### 🔹 Use Cases:
- Storing unique IDs
- Removing duplicates
- Fast lookups for presence

### 🔹 Example:
```java
HashSet<String> cities = new HashSet<>();
cities.add("Mumbai");
cities.add("Delhi");
cities.add("Mumbai"); // Duplicate, ignored
```

### 🔹 Internal Working:
Uses a `HashMap`:
```java
map.put(element, PRESENT);
```

---

## ✅ What is a HashMap?
A `HashMap<K, V>` stores key-value pairs with **O(1)** average time complexity for `put()` and `get()`.

### 🔹 Internal Structure:
- Array of buckets
- Each bucket holds a linked list (or tree in Java 8+)

### 🔹 Key Operations:
```java
put(key, value)
get(key)
remove(key)
```

### 🔹 Resizing Mechanism:
- When size > capacity * load factor, it resizes (doubles capacity)
- All keys are rehashed

---

## ✅ What is Collision in HashMap?
A **collision** occurs when two keys hash to the **same index**.

### 🔹 Handling Collisions:
- **Chaining** with linked list (Java 7 and earlier)
- **Treeing** with Red-Black Tree (Java 8+)

---

## ✅ HashMap vs Hashtable

| Feature            | HashMap         | Hashtable        |
|--------------------|------------------|------------------|
| Thread-safe        | ❌ No           | ✅ Yes           |
| Null keys/values   | ✅ Yes (1 key)  | ❌ No            |
| Performance        | ✅ Fast         | ❌ Slower        |
| Introduced in      | Java 1.2        | Java 1.0         |
| Use Instead        | ✅ ConcurrentHashMap |

---

## ✅ Load Factor in HashMap

### 🔹 Definition:
Controls when HashMap resizes:
```
threshold = capacity × loadFactor
```

### 🔹 Default Value:
```java
0.75f
```

### 🔹 Example:
```java
new HashMap<>(16, 0.75f); // resizes at 12 elements
```

---

## ✅ How HashMap Resizes

1. Doubles capacity
2. Recomputes new index: `(newCapacity - 1) & hash`
3. Rehashes all entries

---

## ✅ Can We Define Custom Load Factor?

Yes! Use:
```java
new HashMap<>(initialCapacity, loadFactor);
```

### 🔹 Example:
```java
new HashMap<>(10, 0.5f);
```

### 🔹 When to Use:
- Low load factor: Better performance, more memory
- High load factor: Less memory, more collisions
