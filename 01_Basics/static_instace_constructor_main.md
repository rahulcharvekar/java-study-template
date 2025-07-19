# Java Execution Order: Static Block, Instance Block, Constructor, and Main Method

## 🔢 Order of Execution

When a Java class runs, the components execute in the following sequence:

1. **Static Block(s)** – Executes once when the class is loaded.
2. **Main Method** – The starting point of the program.
3. **Instance Block(s)** – Executes every time an object is created, before the constructor.
4. **Constructor** – Executes after instance block, to initialize the object.

---

## ✅ Code Example

```java
public class ExecutionOrder {

    // Static block
    static {
        System.out.println("1. Static Block");
    }

    // Instance block
    {
        System.out.println("3. Instance Block");
    }

    // Constructor
    public ExecutionOrder() {
        System.out.println("4. Constructor");
    }

    // Main method
    public static void main(String[] args) {
        System.out.println("2. Main Method");
        ExecutionOrder obj1 = new ExecutionOrder();
        ExecutionOrder obj2 = new ExecutionOrder();
    }
}
```

### Output 
1. Static Block  
2. Main Method  
3. Instance Block  
4. Constructor  
3. Instance Block  
4. Constructor

| Step             | Description                                                    |
| ---------------- | -------------------------------------------------------------- |
| `Static Block`   | Executes **once** when the class is loaded by the JVM.         |
| `Main Method`    | Entry point of the Java application.                           |
| `Instance Block` | Executes **before the constructor**, for every object created. |
| `Constructor`    | Initializes the newly created object after the instance block. |
