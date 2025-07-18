
# Spring Bean Lifecycle and Core Features

## Part 1: Spring Bean Lifecycle

The lifecycle of a Spring bean is managed by the Spring IoC container.

---

### Key Lifecycle Phases

1. **Instantiation** – Spring creates the bean instance  
2. **Populate Properties** – Dependencies injected  
3. **BeanNameAware** – setBeanName() called  
4. **BeanFactoryAware** – setBeanFactory() called  
5. **ApplicationContextAware** – setApplicationContext() called  
6. **Pre-Initialization** – postProcessBeforeInitialization()  
7. **InitializingBean / @PostConstruct** – init callbacks  
8. **Custom init-method** – invoked if configured  
9. **Post-Initialization** – postProcessAfterInitialization()  
10. **Ready for use**  
11. **Destroy phase** – destroy(), @PreDestroy, custom destroy-method

---

### Diagram Overview

```
[Create Instance] → [Inject Dependencies] → [Aware Interfaces] → [PostConstruct/init()] → [Bean Ready] → [PreDestroy/destroy()]
```

---

### Common Annotations

- `@PostConstruct`  
- `@PreDestroy`

---

### Example

```java
@Component
public class MyBean implements InitializingBean, DisposableBean {
    public void afterPropertiesSet() {
        System.out.println("InitializingBean called");
    }

    public void destroy() {
        System.out.println("DisposableBean called");
    }

    @PostConstruct
    public void init() {
        System.out.println("PostConstruct method");
    }

    @PreDestroy
    public void cleanup() {
        System.out.println("PreDestroy method");
    }
}
```

---

## Part 2: Key Features of Spring Framework

1. **IoC (Inversion of Control)** – Object lifecycle & dependency management  
2. **AOP (Aspect-Oriented Programming)** – Cross-cutting concerns  
3. **Declarative Transactions** – `@Transactional` support  
4. **MVC Web Framework** – RESTful apps with Spring MVC  
5. **Spring Boot** – Auto-config & embedded servers  
6. **Spring Data** – Simplified data access  
7. **Spring Security** – Auth & authorization  
8. **Spring Integration & Batch** – Messaging, batch jobs  
9. **Testing Support** – `@MockBean`, `@WebMvcTest`, etc.  
10. **Spring Cloud** – Microservice tools like config server, Eureka, gateway

---

### Common Annotations Summary

- `@Component` / `@Service` / `@Repository` / `@Controller`  
- `@Autowired` / `@Inject`  
- `@Configuration` / `@Bean`  
- `@PostConstruct` / `@PreDestroy`  
- `@Transactional`  
- `@Value`  
- `@Qualifier`

---
**Spring provides a powerful, extensible ecosystem for enterprise-grade apps.**
