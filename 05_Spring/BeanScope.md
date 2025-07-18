

# Spring Bean Scopes Explained

## What is a Bean Scope?

A **bean scope** in Spring defines how many instances of a bean are created and how long they live.

---

## Common Bean Scopes

1. **singleton** (default)  
   - One shared instance per Spring container  
   - `@Scope("singleton")`

2. **prototype**  
   - A new instance is created each time it is requested  
   - `@Scope("prototype")`

3. **request** (Web Only)  
   - One instance per HTTP request

4. **session** (Web Only)  
   - One instance per HTTP session

5. **application** (Web Only)  
   - One instance per ServletContext

6. **websocket** (WebSocket Only)  
   - One instance per WebSocket session

---

## Example Usage

```java
@Component
@Scope("singleton")
public class MySingletonBean {}

@Component
@Scope("prototype")
public class MyPrototypeBean {}
```

---

## Comparison

- `singleton`: `ctx.getBean(...) == ctx.getBean(...) → true`  
- `prototype`: `ctx.getBean(...) == ctx.getBean(...) → false`

---

## Defining a Custom Scope (ThreadLocal Example)

### 1. Create the Scope Class

```java
public class ThreadLocalScope implements Scope {
    private final ThreadLocal<Map<String, Object>> threadScope = ThreadLocal.withInitial(HashMap::new);

    public Object get(String name, ObjectFactory<?> objectFactory) {
        return threadScope.get().computeIfAbsent(name, k -> objectFactory.getObject());
    }

    public Object remove(String name) {
        return threadScope.get().remove(name);
    }

    public void registerDestructionCallback(String name, Runnable callback) {}
    public Object resolveContextualObject(String key) { return null; }
    public String getConversationId() { return "thread-local"; }
}
```

### 2. Register the Custom Scope

```java
@Configuration
public class CustomScopeConfig implements BeanFactoryPostProcessor {
    public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) {
        beanFactory.registerScope("thread", new ThreadLocalScope());
    }
}
```

### 3. Use the Custom Scope

```java
@Component
@Scope("thread")
public class ThreadScopedBean {
    public ThreadScopedBean() {
        System.out.println("New thread-scoped bean created");
    }
}
```

---

## Summary Table

| Scope         | Lifetime                        | Use Case                               |
|---------------|----------------------------------|-----------------------------------------|
| singleton     | App-wide, one per container      | Shared services, stateless components   |
| prototype     | New instance per injection       | Stateful beans, e.g. commands           |
| request       | One per HTTP request             | Web controllers/services                |
| session       | One per HTTP session             | User session beans                      |
| application   | One per ServletContext           | Application-wide context beans          |
| websocket     | One per WebSocket session        | WebSocket-based chat, live feeds        |
| custom/thread | As per developer logic           | Thread-local, dynamic context, etc.     |
