In Java, the static keyword is used to indicate that a member (variable or method) belongs to the class rather than to instances (objects) of the class.

## 🔹 1. Static Variables (Class Variables)
A static variable is shared among all instances of a class.

```java
Copy
Edit
class Counter {
    static int count = 0;

    Counter() {
        count++;
        System.out.println(count);
    }
}

public class Main {
    public static void main(String[] args) {
        new Counter(); // prints 1
        new Counter(); // prints 2
        new Counter(); // prints 3
    }
}
```

Explanation: count is shared across all Counter objects.

## 🔹 2. Static Methods
Static methods can be called without creating an instance of the class. They can’t access non-static members directly.

```java
class MathUtils {
    static int square(int x) {
        return x * x;
    }
}

public class Main {
    public static void main(String[] args) {
        System.out.println(MathUtils.square(5)); // 25
    }
}
```

## 🔹 3. Static Blocks
Static blocks are used to initialize static variables. They run once when the class is loaded.

```java
class Example {
    static int x;

    static {
        x = 10;
        System.out.println("Static block executed");
    }
}
```

## 🔹 4. Static Classes (Nested Classes)
You can define a static class within another class. It can be accessed without an outer class instance.

```java
class Outer {
    static class Inner {
        void show() {
            System.out.println("Inside static nested class");
        }
    }
}
```

Usage:

```java
Outer.Inner obj = new Outer.Inner();
obj.show();
```

## 🔁 Summary
Use Case	Behavior
static variable	Shared across all instances
static method	Can be called without an object
static block	Executes once when class is loaded
static class	Nested class not tied to outer class instance
