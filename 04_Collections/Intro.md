# Java Collections Framework

Java Collections Framework (JCF) provides a set of classes and interfaces for storing and manipulating groups of data. It is divided into several types based on their characteristics and usage.

---

## 1. Collection Interface (Root Interface)
All collections inherit from this interface.

### Subtypes:
- **List**
- **Set**
- **Queue**

---

## 2. List Interface
An ordered collection (allows duplicates, indexed).

| Implementation   | Description                                 |
|------------------|---------------------------------------------|
| `ArrayList`      | Resizable array, fast random access         |
| `LinkedList`     | Doubly-linked list, good for insert/remove  |
| `Vector`         | Legacy, synchronized                        |
| `Stack`          | LIFO stack built on `Vector`                |

---

## 3. Set Interface
Unordered collection that does not allow duplicates.

| Implementation    | Description                                 |
|-------------------|---------------------------------------------|
| `HashSet`         | Fast, unordered, uses hash table            |
| `LinkedHashSet`   | Maintains insertion order                   |
| `TreeSet`         | Sorted set based on `Comparable` or `Comparator` |

---

## 4. Queue Interface
Designed for holding elements prior to processing (FIFO by default).

| Implementation     | Description                                 |
|--------------------|---------------------------------------------|
| `PriorityQueue`    | Elements ordered by natural order or comparator |
| `ArrayDeque`       | Double-ended queue                          |
| `LinkedList`       | Implements both `List` and `Queue`          |

---

## 5. Deque Interface
Double-ended queue supporting insertion/removal from both ends.

| Implementation     | Description                      |
|--------------------|----------------------------------|
| `ArrayDeque`       | Most commonly used `Deque`       |
| `LinkedList`       | Also implements `Deque`          |

---

## 6. Map Interface (Not part of Collection hierarchy)
Maps key-value pairs; keys must be unique.

| Implementation     | Description                                      |
|--------------------|--------------------------------------------------|
| `HashMap`          | Unordered, allows null keys/values               |
| `LinkedHashMap`    | Maintains insertion order                        |
| `TreeMap`          | Sorted by keys                                   |
| `Hashtable`        | Legacy, synchronized                             |
| `ConcurrentHashMap`| Thread-safe, better than Hashtable in concurrency|

---

## 7. Others
- **EnumSet** – High-performance `Set` for enum types
- **WeakHashMap** – Keys are garbage-collected if no strong reference
- **IdentityHashMap** – Uses reference-equality instead of `equals()`
- **Collections Class** – Utility class (sorting, searching, etc.)
- **Arrays Class** – Utility methods for arrays

---

## Diagram


Collection
├── List
│ ├── ArrayList
│ ├── LinkedList
│ └── Vector → Stack
├── Set
│ ├── HashSet
│ ├── LinkedHashSet
│ └── TreeSet
└── Queue
├── LinkedList
├── PriorityQueue
└── ArrayDeque

Map (separate)
├── HashMap
├── LinkedHashMap
├── TreeMap
└── Hashtable
