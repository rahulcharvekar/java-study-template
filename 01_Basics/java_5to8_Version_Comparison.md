# 🧩 Java 5 – Major New Language Features
## 🎯 First major leap after Java 1.4

Generics

```java

List<String> list = new ArrayList<>();
```
Enhanced for loop (for-each)

```java

for (String s : list) { ... }
```
Autoboxing / Unboxing

```java

Integer a = 5; // Auto-converted from int
```

Varargs

```java
void print(String... args) { ... }
```

Enums

```java
enum Direction { NORTH, SOUTH, EAST, WEST }
```
Annotations

```java

@Override, @Deprecated, @SuppressWarnings
```
Static import

```java
Copy
Edit
import static java.lang.Math.*;
```

## 🚀 Java 6 – Performance & API Improvements
JDBC 4.0 – auto loading of drivers

Compiler API (JSR 199)

Scripting support via javax.script (e.g., JavaScript)

Web services API (JAX-WS, JAXB)

Improved JVM performance

Pluggable annotations processing

No significant language syntax changes

## 🔧 Java 7 – Language Enhancements & NIO
Diamond Operator

```java
List<String> list = new ArrayList<>(); // No need to repeat type
try-with-resources
```

```java
try (BufferedReader br = new BufferedReader(...)) { ... }
Multi-catch block
```

```java
catch (IOException | SQLException ex) { ... }
Strings in switch
```

```java
switch(day) { case "MONDAY": ... }
```
Binary literals & underscores in numeric literals

```java
int binary = 0b1010;
int million = 1_000_000;
```

NIO.2 File I/O API

```java
Path path = Paths.get("file.txt");
```

## ⚡ Java 8 – Biggest Shift: Functional Programming
Lambda Expressions

```java
(a, b) -> a + b
```

Functional Interfaces
```java
interface MyFunc { int operation(int a); }
```

Stream API

```java
list.stream().filter(x -> x > 10).collect(Collectors.toList());
```

Default & static methods in interfaces

```java
interface MyIntf {
    default void log() { }
}
Optional class – avoid null
```

```java
Optional<String> name = Optional.of("Java");
```

Date & Time API (java.time)

```java
LocalDate now = LocalDate.now();
```
Nashorn JavaScript Engine

## 📌 Summary Table

| Feature                          | Java 5 | Java 6 | Java 7 | Java 8 |
|----------------------------------|--------|--------|--------|--------|
| Generics                         | ✅     | ✅     | ✅     | ✅     |
| Annotations                      | ✅     | ✅     | ✅     | ✅     |
| Enhanced for-loop                | ✅     | ✅     | ✅     | ✅     |
| Autoboxing / Unboxing            | ✅     | ✅     | ✅     | ✅     |
| Static import                    | ✅     | ✅     | ✅     | ✅     |
| try-with-resources               | ❌     | ❌     | ✅     | ✅     |
| Multi-catch exception            | ❌     | ❌     | ✅     | ✅     |
| Diamond operator                 | ❌     | ❌     | ✅     | ✅     |
| Strings in switch                | ❌     | ❌     | ✅     | ✅     |
| NIO.2 File API                   | ❌     | ❌     | ✅     | ✅     |
| Lambda Expressions               | ❌     | ❌     | ❌     | ✅     |
| Stream API                       | ❌     | ❌     | ❌     | ✅     |
| Functional Interfaces            | ❌     | ❌     | ❌     | ✅     |
| Default methods in interfaces    | ❌     | ❌     | ❌     | ✅     |
| Optional Class                   | ❌     | ❌     | ❌     | ✅     |
| Date and Time API (`java.time`)  | ❌     | ❌     | ❌     | ✅     |
| Nashorn JavaScript Engine        | ❌     | ❌     | ❌     | ✅     |

