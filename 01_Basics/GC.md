In Java, **Garbage Collection (GC)** is the process by which the **Java Virtual Machine (JVM)** automatically deletes objects that are **no longer reachable** in memory, freeing up resources and preventing memory leaks.

---

### 🔁 How Garbage Collection Works in Java

1. **Object Allocation**:

   * Whenever you create an object (`new` keyword), it's stored in **Heap Memory**.

2. **Reachability Analysis**:

   * JVM checks whether objects are **reachable** through references.
   * If no references point to an object, it's considered **unreachable** and eligible for garbage collection.

3. **Garbage Collector Execution**:

   * JVM runs the GC (either periodically or on demand).
   * It removes unreachable objects and reclaims memory.

4. **Finalization (optional)**:

   * If an object overrides `finalize()`, JVM calls it **once** before collecting the object.
   * **Note**: Using `finalize()` is discouraged in modern Java (deprecated since Java 9).

---

### ✅ Example

```java
public class GarbageCollectionExample {
    String name;

    public GarbageCollectionExample(String name) {
        this.name = name;
    }

    // Optional: finalize method (not recommended anymore)
    @Override
    protected void finalize() throws Throwable {
        System.out.println(this.name + " is being collected.");
    }

    public static void main(String[] args) {
        GarbageCollectionExample obj1 = new GarbageCollectionExample("Object1");
        GarbageCollectionExample obj2 = new GarbageCollectionExample("Object2");

        obj1 = null;  // Now eligible for GC
        obj2 = null;  // Also eligible

        // Suggesting JVM to run GC (not guaranteed)
        System.gc();

        System.out.println("Main ends");
    }
}
```

### Output:

```
Main ends
Object2 is being collected.
Object1 is being collected.
```

(Note: The actual output of the `finalize()` message is **not guaranteed** to appear or in which order—it depends on JVM.)

---

### 🚀 Types of Garbage Collectors in Java (Post Java 8+)

| Collector Name              | Description                               |
| --------------------------- | ----------------------------------------- |
| Serial GC                   | Single-threaded, for small applications   |
| Parallel GC                 | Multi-threaded, good for throughput       |
| CMS (Concurrent Mark Sweep) | Low pause time, but deprecated            |
| G1 GC                       | Balanced, low-latency, default in Java 9+ |
| ZGC / Shenandoah            | Ultra-low pause time, scalable (Java 11+) |

---

### 🔍 GC Lifecycle Simplified

```
[Object Created] → [Reachable] → [Unreachable] → [GC Called] → [Memory Freed]
```

---

### 🧠 Best Practices

* Don't rely on `System.gc()`—let JVM handle GC.
* Avoid using `finalize()`—use `AutoCloseable` and `try-with-resources` for cleanup.
* Use profiling tools (e.g., VisualVM, JConsole) to monitor GC behavior.
* Use `WeakReference`/`SoftReference` for cache or optional references.

---


