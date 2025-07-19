In Spring Framework, the annotations `@Component`, `@Service`, `@Repository`, and `@Controller` are **stereotype annotations**. They are used to define **Spring-managed beans** and indicate their specific roles in the application’s architecture.

They are functionally similar because they all make a class eligible for **component scanning** and **dependency injection**, but they have **semantic differences** for clarity, tool support, and AOP.

---

### 🔹 1. `@Component`

**Generic stereotype** for any Spring-managed component.

#### ✅ Use case:

When your class doesn’t fit into other more specific stereotypes.

#### ✅ Example:

```java
@Component
public class EmailValidator {
    public boolean isValid(String email) {
        return email.contains("@");
    }
}
```

---

### 🔹 2. `@Service`

Specialized version of `@Component`, used in the **service layer**. It indicates **business logic**.

#### ✅ Use case:

Used for classes that perform **business operations** or service tasks.

#### ✅ Example:

```java
@Service
public class UserService {
    public String getUserRole(String username) {
        return "ADMIN";
    }
}
```

---

### 🔹 3. `@Repository`

Specialized `@Component`, used in the **DAO layer (Data Access Layer)**. It also:

* Automatically translates database exceptions into **Spring’s DataAccessException**.

#### ✅ Use case:

Used for classes interacting with a **database or persistent storage**.

#### ✅ Example:

```java
@Repository
public class UserRepository {
    public User findById(Long id) {
        // Simulate DB fetch
        return new User(id, "John");
    }
}
```

---

### 🔹 4. `@Controller`

Specialized `@Component`, used in the **web layer**, typically with **Spring MVC** to handle **HTTP requests**.

#### ✅ Use case:

Used for **defining web endpoints** and **returning views or JSON**.

#### ✅ Example:

```java
@Controller
public class UserController {

    @GetMapping("/hello")
    @ResponseBody
    public String sayHello() {
        return "Hello from Controller";
    }
}
```

---

### 🧠 Summary Table

| Annotation    | Layer             | Purpose                                   | Extra Behavior          |
| ------------- | ----------------- | ----------------------------------------- | ----------------------- |
| `@Component`  | Any               | Generic Spring-managed bean               | None                    |
| `@Service`    | Service Layer     | Business logic/service functionality      | None (semantic clarity) |
| `@Repository` | Persistence Layer | DAO class interacting with DB             | Converts SQL exceptions |
| `@Controller` | Web Layer (MVC)   | Handles HTTP requests in web applications | Works with Spring MVC   |

---

