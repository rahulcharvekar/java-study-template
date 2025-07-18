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

