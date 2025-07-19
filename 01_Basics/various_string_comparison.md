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
