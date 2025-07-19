# ✅ Custom `equals()` and `hashCode()` in Java

When using collections like `HashMap` or `HashSet`, it's critical to override both:

- `equals()` — defines object equality
- `hashCode()` — defines bucket placement in hash-based collections

---

## 🔹 Why Override Both?

If two objects are *equal* according to `equals()`, they **must** return the same hash code from `hashCode()`. This ensures correct behavior in hash-based collections.

---

## 🔧 Example Class: `Employee`

```java
public class Employee {
    private int id;
    private String name;

    // Constructor
    public Employee(int id, String name) {
        this.id = id;
        this.name = name;
    }

    // Custom equals()
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;                  // same reference
        if (o == null || getClass() != o.getClass()) return false;

        Employee other = (Employee) o;
        return id == other.id && 
               (name != null ? name.equals(other.name) : other.name == null);
    }

    // Matching hashCode()
    @Override
    public int hashCode() {
        int result = Integer.hashCode(id);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }
}
