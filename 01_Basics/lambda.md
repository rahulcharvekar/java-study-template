### Syntax of a Lambda Expression
```java

(parameter1, parameter2, ...) -> { body }
Or simplified:
```
```java
a -> a * a         // single parameter, no parentheses or braces needed
(x, y) -> x + y    // multiple parameters
() -> System.out.println("Hello")  // no parameters
```

### 📘 Example with Functional Interface
```java
@FunctionalInterface
interface MathOperation {
    int operate(int a, int b);
}

public class LambdaDemo {
    public static void main(String[] args) {
        MathOperation add = (a, b) -> a + b;
        MathOperation multiply = (a, b) -> a * b;

        System.out.println("Sum: " + add.operate(5, 3));        // Output: Sum: 8
        System.out.println("Product: " + multiply.operate(5, 3)); // Output: Product: 15
    }
}
```

### 🔍 Why Use Lambda Expressions?
Benefit	Description
Less Code	No need for anonymous class implementation.
Readable & Clean	Removes boilerplate code.
Functional Programming	Enables Java to support functional programming concepts.
Used with Streams & APIs	Makes working with collections and APIs more expressive.

### 🔗 Common Use Cases
Implementing functional interfaces (e.g., Runnable, Comparator, ActionListener)

Working with Streams API

Sorting and filtering collections

Event handling in GUI apps

### 🧠 Behind the Scenes
Java compiles lambda expressions to anonymous inner classes or uses invokedynamic for optimization (introduced in Java 8).
