# 🔤 Java: String vs. StringBuffer vs. StringBuilder

Java provides three main classes to handle text data: `String`, `StringBuffer`, and `StringBuilder`. Each serves a different purpose based on **immutability**, **thread safety**, and **performance**.

---

## ✅ Quick Comparison Table

| Feature              | `String`               | `StringBuffer`                   | `StringBuilder`                   |
|----------------------|------------------------|----------------------------------|----------------------------------|
| **Mutability**       | ❌ Immutable           | ✅ Mutable                       | ✅ Mutable                       |
| **Thread-safe**      | ❌ No                  | ✅ Yes (synchronized)            | ❌ No                            |
| **Performance**      | 🚫 Slow (new object on change) | 🐢 Slower (due to sync)     | ⚡ Fastest (no sync)             |
| **Introduced In**    | Java 1.0               | Java 1.0                         | Java 1.5                         |
| **Use Case**         | Constant text          | Multi-threaded text operations  | Single-threaded text operations  |

---

## 📌 1. `String` – Immutable Sequence of Characters

### 🔹 Characteristics:
- Any operation (`+`, `concat()`) creates a **new object**
- Safe to use but **inefficient for heavy modifications**

### 🔹 Example:
```java
String s = "Hello";
s = s + " World"; // Creates new object
```

## 📌 2. StringBuffer – Mutable and Thread-safe
🔹 Characteristics:
Methods are synchronized

Safe for multi-threaded environments

Slower than StringBuilder due to synchronization

### 🔹 Example:
```java

StringBuffer sb = new StringBuffer("Hello");
sb.append(" World"); // Modifies existing object
```

## 📌 3. StringBuilder – Mutable and Fast (Not Thread-safe)
🔹 Characteristics:
Similar to StringBuffer but non-synchronized

Best choice for single-threaded applications

Much faster than String or StringBuffer

### 🔹 Example:
```java

StringBuilder sb = new StringBuilder("Hello");
sb.append(" World"); // Modifies in-place
```

📊 Performance Benchmark (Rough Idea)
Operation	String	StringBuffer	StringBuilder
10,000 appends (single-thread)	❌ Very slow	⚠️ Moderate	✅ Fastest

🔄 When to Use What?
Scenario	Use This
Static or constant text	String
Modifying strings in loops	StringBuilder
Modifying strings in multiple threads	StringBuffer

🧠 Summary
Use String for constant or rarely modified text.

Use StringBuilder when performance matters in single-threaded scenarios.

Use StringBuffer for thread-safe modifications, though StringBuilder is preferred when sync isn't needed.

javascript
Copy
Edit
