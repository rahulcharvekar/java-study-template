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


# Design Patterns in Java

This file explains 4 commonly used design patterns in Java with:
- Code examples
- Real-world analogies
- Diagram references

---

## 1. Singleton Pattern

**Purpose:** Ensure a class has only one instance and provide a global point of access.

```java
public class Singleton {
    private static Singleton instance;

    private Singleton() {}

    public static Singleton getInstance() {
        if (instance == null) {
            instance = new Singleton();
        }
        return instance;
    }
}
```

**Analogy:** Controlling access to a printer – only one instance is needed to manage usage.

**Diagram Reference:** See top-left of the image (Singleton Pattern).

---

## 2. Factory Pattern

**Purpose:** Define an interface for creating an object, but let subclasses decide which class to instantiate.

```java
interface Shape {
    void draw();
}

class Circle implements Shape {
    public void draw() {
        System.out.println("Drawing Circle");
    }
}

class Square implements Shape {
    public void draw() {
        System.out.println("Drawing Square");
    }
}

class ShapeFactory {
    public Shape getShape(String type) {
        if (type.equalsIgnoreCase("circle")) return new Circle();
        else if (type.equalsIgnoreCase("square")) return new Square();
        return null;
    }
}
```

**Analogy:** Ordering a product from a factory – you don’t need to know how it's made.

**Diagram Reference:** See top-right of the image (Factory Pattern).

---

## 3. Observer Pattern

**Purpose:** When one object changes state, all its dependents are notified automatically.

```java
class Subject {
    private List<Observer> observers = new ArrayList<>();
    private int state;

    public void attach(Observer o) {
        observers.add(o);
    }

    public void setState(int state) {
        this.state = state;
        notifyAllObservers();
    }

    public void notifyAllObservers() {
        for (Observer o : observers) {
            o.update();
        }
    }

    public int getState() {
        return state;
    }
}

abstract class Observer {
    protected Subject subject;
    public abstract void update();
}

class HexObserver extends Observer {
    public HexObserver(Subject subject) {
        this.subject = subject;
        this.subject.attach(this);
    }

    public void update() {
        System.out.println("Hex: " + Integer.toHexString(subject.getState()));
    }
}
```

**Analogy:** Subscribing to stock price changes – observers get notified when prices update.

**Diagram Reference:** See bottom-left of the image (Observer Pattern).

---

## 4. Strategy Pattern

**Purpose:** Define a family of algorithms and make them interchangeable.

```java
interface PaymentStrategy {
    void pay(int amount);
}

class CreditCardPayment implements PaymentStrategy {
    public void pay(int amount) {
        System.out.println("Paid " + amount + " using Credit Card");
    }
}

class PayPalPayment implements PaymentStrategy {
    public void pay(int amount) {
        System.out.println("Paid " + amount + " using PayPal");
    }
}

class ShoppingCart {
    private PaymentStrategy strategy;

    public void setPaymentStrategy(PaymentStrategy strategy) {
        this.strategy = strategy;
    }

    public void checkout(int amount) {
        strategy.pay(amount);
    }
}
```

**Analogy:** Choosing a route for a journey – strategy defines which route to use.

**Diagram Reference:** See bottom-right of the image (Strategy Pattern).
