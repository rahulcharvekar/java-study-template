# Java Serialization Explained

## What is Serialization?

Serialization is the process of converting a Java object into a byte stream.  
Deserialization is the reverse process – converting byte stream back into an object.

---

## Uses of Serialization

1. Save object state to a file or DB  
2. Send objects over a network (e.g., RMI, sockets)  
3. Deep cloning  
4. Caching  
5. Object communication in distributed systems  

---

## How Java Knows a Class is Serializable

A class must implement the `java.io.Serializable` interface.  
It is a marker interface (no methods) that tells JVM this class can be serialized.

### Example

```java
class Employee implements Serializable {
    private static final long serialVersionUID = 1L;
    int id;
    String name;
}
```

---

## What is serialVersionUID?

A unique identifier for each Serializable class that ensures version compatibility.  
Always define it explicitly to avoid `InvalidClassException`.

```java
private static final long serialVersionUID = 1L;
```

---

## How to Prevent Serialization

1. **Do not implement `Serializable`**  
2. **Mark fields as `transient`**  
3. **Override `writeObject()` to block serialization:**

```java
private void writeObject(ObjectOutputStream oos) throws IOException {
    throw new NotSerializableException("Serialization is not allowed");
}
```

4. **Use `Externalizable` with empty methods** – for full manual control.

---

## Real-world Analogy

Serialization is like **freezing food** (object) into a sealed pack (byte stream).  
Deserialization is like **reheating** it back into the original dish.

---

## Summary Table

| Feature            | Purpose                                 |
|--------------------|------------------------------------------|
| Serializable       | Mark class for serialization             |
| serialVersionUID   | Ensure compatibility                     |
| transient          | Skip field during serialization          |
| writeObject()      | Customize or block serialization         |
| Externalizable     | Fully control what gets serialized       |

# 🔹 What Is Deserialization in Java?
Deserialization is the process of converting a byte stream back into a Java object. It is the reverse of serialization, where an object is converted into a byte stream to be saved to a file, sent over a network, etc.

# 🔁 Serialization vs Deserialization
Process	Description
Serialization	Java object → Byte stream (for storage/transmission)
Deserialization	Byte stream → Java object (reconstruction)

# ✅ How Deserialization Works – Step-by-Step
A byte stream (e.g., from a file or network) is provided to ObjectInputStream.

Java uses class metadata and the byte stream to rebuild the object.

The fields are restored exactly as they were when serialized.

The deserialized object is returned as a new Java object.

## 📘 Example
### 1. Serializable Class

```java

import java.io.Serializable;

class Person implements Serializable {
    private static final long serialVersionUID = 1L;
    String name;
    int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
}
```

### 2. Serialize (Save to File)
```java

import java.io.*;

public class SerializeDemo {
    public static void main(String[] args) throws IOException {
        Person p = new Person("Alice", 30);

        ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream("person.ser"));
        out.writeObject(p);
        out.close();
    }
}
```

### 3. Deserialize (Read from File)
```java
import java.io.*;

public class DeserializeDemo {
    public static void main(String[] args) throws IOException, ClassNotFoundException {
        ObjectInputStream in = new ObjectInputStream(new FileInputStream("person.ser"));
        Person p = (Person) in.readObject();
        in.close();

        System.out.println("Name: " + p.name + ", Age: " + p.age);
    }
}
```

## 🔐 Security Tip
Deserialization can be dangerous if the source of the byte stream is untrusted—it can lead to remote code execution (RCE) attacks. Always validate or avoid deserialization from unknown sources.

## 🧠 Key Points
The class must implement Serializable.

A serialVersionUID helps in version control during deserialization.

Transient fields are not serialized (and hence not restored).

Constructor is not called during deserialization—object is built from the stream.
