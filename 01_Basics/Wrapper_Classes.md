# 📦 Wrapper Classes in Java

## ✅ What Are Wrapper Classes?

Wrapper classes are object representations of Java's **primitive data types**. They are used to **wrap primitives into objects** so they can be used in **collections, generics, and APIs** that require objects.

| Primitive Type | Wrapper Class  |
|----------------|----------------|
| `byte`         | `Byte`         |
| `short`        | `Short`        |
| `int`          | `Integer`      |
| `long`         | `Long`         |
| `float`        | `Float`        |
| `double`       | `Double`       |
| `char`         | `Character`    |
| `boolean`      | `Boolean`      |

---

## 🎯 Key Uses of Wrapper Classes

### 1. **Working with Collections**
Collections like `ArrayList` only store objects (not primitives).

```java
List<Integer> numbers = new ArrayList<>();
numbers.add(10); // int automatically converted to Integer
```
### 2. Autoboxing and Unboxing
Autoboxing: Converting a primitive to a wrapper object automatically.

Unboxing: Converting a wrapper object back to a primitive.

```java
Integer num = 10;      // autoboxing
int n = num;           // unboxing
```

### 3. Utility Methods
Wrapper classes provide useful methods for parsing and conversions.

```java
int val = Integer.parseInt("123");
String s = Double.toString(10.5);
```

### 4. Null Support
Primitives can’t be null, but wrapper objects can.

```java
Integer count = null; // useful in databases where value can be missing
```

### 5. Type Conversion
Wrapper classes help in converting between types.

```java
Double d = Double.valueOf("3.14");
int i = d.intValue();
```

### 6. Generics Compatibility
Java Generics work only with objects, not primitives.

```java
List<Double> list = new ArrayList<>();
```

## ⚠️ Performance Note
Using wrapper classes adds memory overhead.

Prefer primitives for performance-critical applications.

## 🧪 Example: Autoboxing with Collections
```java
List<Integer> scores = new ArrayList<>();
scores.add(85); // int → Integer (autoboxed)
int total = scores.get(0); // Integer → int (unboxed)
```

##
📌 Summary
Wrapper classes wrap primitives into objects.

They enable use in collections, generics, and provide utility methods.

Java provides autoboxing/unboxing to ease the conversion between primitives and objects.
