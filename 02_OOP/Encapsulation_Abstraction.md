# 🧵 Encapsulation vs. Abstraction in Java

| Aspect               | Encapsulation                                     | Abstraction                                        |
|----------------------|---------------------------------------------------|----------------------------------------------------|
| **Definition**       | Wrapping data (variables) and code (methods) together into a single unit (class). | Hiding internal implementation details and showing only the essential features. |
| **Purpose**          | Protect data from unauthorized access and modification. | Simplify complexity by exposing only relevant parts. |
| **How it's done**    | Using access modifiers (`private`, `public`, etc.) and getter/setter methods. | Using abstract classes or interfaces.              |
| **Focus**            | Data hiding.                                       | Functionality hiding.                              |
| **Real-world example** | Medical capsule (keeps ingredients safe inside).  | Driving a car without knowing how the engine works. |
| **Java keywords**    | `private`, `public`, `protected`                  | `abstract`, `interface`                            |
| **Used in**          | Class design and data security                    | System design and interface definition             |

---

## ✅ Code Example: Encapsulation

```java
public class Person {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
```

```java
abstract class Animal {
    abstract void makeSound();
}

class Dog extends Animal {
    void makeSound() {
        System.out.println("Bark");
    }
}

```

## 📌 Summary
Encapsulation is about how you expose or restrict access to the internals of an object.

Abstraction is about what you expose to the outside world by hiding the internal complexity.
