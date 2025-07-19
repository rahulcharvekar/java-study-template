## What is Reflection in Java?
Reflection is a feature in Java that allows a program to introspect (inspect) and manipulate classes, methods, fields, and constructors at runtime, even if they are private.

Java provides this capability via the java.lang.reflect package.

## Common Use Cases of Reflection
Use Case	Description
Inspecting classes at runtime	Get class name, fields, methods, annotations, etc.
Accessing private members	Access and modify private fields or call private methods
Instantiating objects dynamically	Create objects without knowing the class at compile time
Invoking methods dynamically	Call methods when method names are not known at compile time
Frameworks and libraries	Used heavily in frameworks like Spring, Hibernate, JUnit, Jackson, etc.
Dependency injection	Create and wire objects automatically using metadata and reflection
Serialization/deserialization	Map Java objects to JSON/XML (e.g., Jackson uses reflection)

### Example: Using Reflection
```java
import java.lang.reflect.*;

class Person {
    private String name = "John";

    public void greet() {
        System.out.println("Hello, " + name);
    }
}

public class ReflectionDemo {
    public static void main(String[] args) throws Exception {
        Class<?> clazz = Class.forName("Person");

        // Create an object of Person
        Object obj = clazz.getDeclaredConstructor().newInstance();

        // Access and modify private field
        Field field = clazz.getDeclaredField("name");
        field.setAccessible(true); // bypass private access
        field.set(obj, "Alice");

        // Invoke method
        Method method = clazz.getMethod("greet");
        method.invoke(obj); // prints: Hello, Alice
    }
}
```

## Pros and Cons
### ✅ Pros:
Powerful for framework development

Enables dynamic behavior

Useful in plugin systems or generic libraries

### ❌ Cons:
Slower than direct code (performance overhead)

Breaks encapsulation (can access private data)

Can lead to security issues

Harder to debug and maintain

## Summary
Reflection allows Java code to inspect and manipulate classes and objects at runtime.

It is powerful but should be used carefully, especially in performance-sensitive or security-critical applications.

Widely used in frameworks, dependency injection, and ORM libraries.
