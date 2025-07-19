# 🔐 Best Practices for Storing Passwords in Java

Storing passwords securely is critical to application security. This guide covers best practices, suitable data structures, and code examples for secure password handling.

---

## ❌ Never Store Plaintext Passwords

Passwords must **never** be stored as plain text in memory, files, or databases.

---

## ✅ Use Hashing + Salting

### 🔐 Recommended Algorithms:
- **PBKDF2** (Java built-in)
- **BCrypt** (commonly used in web applications)
- **Argon2** (most secure, requires third-party libraries like Bouncy Castle)

---

## 📦 Suitable Data Structures

| Use Case                     | Recommended Data Structure                 |
|------------------------------|--------------------------------------------|
| Temporary/in-memory storage  | `ConcurrentHashMap<String, String>`        |
| Persistent storage            | Relational DB (store **hashed** password) |
| Configs/secrets management    | Use **Secrets Manager** (e.g., AWS, Vault) |

**Important:** Always store hashed values, not raw passwords.

---

## 🧪 Example: In-Memory Password Cache (for Authentication)

```java
import java.util.concurrent.ConcurrentHashMap;
import java.util.Map;

Map<String, String> userPasswordMap = new ConcurrentHashMap<>();

// Store hashed password
String hashedPassword = hashPassword("mySecret123");
userPasswordMap.put("user@example.com", hashedPassword);

import java.security.SecureRandom;
import java.security.spec.KeySpec;
import java.util.Base64;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

public String hashPassword(String password) throws Exception {
    byte[] salt = new byte[16];
    SecureRandom.getInstanceStrong().nextBytes(salt);

    KeySpec spec = new PBEKeySpec(password.toCharArray(), salt, 65536, 128);
    SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");

    byte[] hash = factory.generateSecret(spec).getEncoded();
    return Base64.getEncoder().encodeToString(hash);
}
