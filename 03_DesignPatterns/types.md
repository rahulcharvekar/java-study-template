# Java Design Patterns Cheat Sheet

Java design patterns are categorized into three main types: **Creational**, **Structural**, and **Behavioral**. Each pattern solves a specific problem in software design.

---

## 1. Creational Patterns

| Pattern           | Purpose                                                             | Example                              |
|------------------|---------------------------------------------------------------------|--------------------------------------|
| **Singleton**     | Ensures a class has only one instance and provides global access.   | Logging, Configs                     |
| **Factory Method**| Creates objects without specifying the exact class.                 | `Calendar.getInstance()`             |
| **Abstract Factory**| Produces families of related objects.                            | GUI toolkits for different OS        |
| **Builder**       | Separates object construction from its representation.              | `StringBuilder`                      |
| **Prototype**     | Clones existing objects instead of creating new ones.               | `Object.clone()`                     |

---

## 2. Structural Patterns

| Pattern         | Purpose                                                             | Example                              |
|----------------|---------------------------------------------------------------------|--------------------------------------|
| **Adapter**     | Converts one interface into another.                                | `InputStreamReader`                  |
| **Bridge**      | Separates abstraction from implementation.                          | Shape abstraction with drawing APIs  |
| **Composite**   | Treats individual objects and compositions uniformly.               | File-system-like structures          |
| **Decorator**   | Adds behavior to objects dynamically.                               | `BufferedReader`                     |
| **Facade**      | Provides a simplified interface.                                    | `javax.faces.context.FacesContext`   |
| **Flyweight**   | Reduces memory usage by sharing.                                    | Font or icon caching                 |
| **Proxy**       | Controls access to another object.                                  | Remote or Virtual proxy              |

---

## 3. Behavioral Patterns

| Pattern           | Purpose                                                             | Example                        |
|------------------|---------------------------------------------------------------------|--------------------------------|
| **Observer**       | Notifies dependents when subject changes.                          | `java.util.Observer`          |
| **Strategy**       | Encapsulates interchangeable algorithms.                           | `Comparator`                  |
| **Command**        | Encapsulates a request as an object.                               | GUI button actions            |
| **Template Method**| Defines skeleton of algorithm.                                     | `java.io.InputStream`         |
| **State**          | Alters behavior based on internal state.                           | Thread states                 |
| **Chain of Responsibility**| Passes request along handlers.                            | Servlet Filters               |
| **Mediator**       | Reduces coupling by centralizing communication.                    | Chat room                     |
| **Memento**        | Captures and restores object state.                                | Undo functionality            |
| **Interpreter**    | Evaluates language grammar or expression.                          | Regex engines                 |
| **Iterator**       | Traverses elements.                                                | `Iterator`, `ListIterator`    |
| **Visitor**        | Performs operations on object structure.                           | AST processing                |

---

## Example: Singleton Pattern

```java
public class Logger {
    private static Logger instance;

    private Logger() {} // Private constructor

    public static Logger getInstance() {
        if (instance == null) {
            instance = new Logger();
        }
        return instance;
    }

    public void log(String msg) {
        System.out.println("Log: " + msg);
    }
}
```

**Usage:**
```java
Logger log = Logger.getInstance();
log.log("App started");
```

---

## What's Next?

You can:
1. Explore **one pattern at a time** in depth with **UML, real-world analogy, and Java code**.
2. Get a **summary sheet or cheat sheet** PDF.
3. Practice **design pattern interview questions**.

