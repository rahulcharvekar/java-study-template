# 🔧 @Autowired in Spring – Explained with Examples
## 📘 What is @Autowired?
@Autowired is an annotation used in Spring for automatic dependency injection.

It allows Spring to resolve and inject collaborating beans automatically without explicit configuration in XML.

## ✅ Where Can @Autowired Be Used?
Location	Description
Constructor	Dependency injected via class constructor
Setter Method	Dependency injected via setter method
Field	Injected directly into the class field
Method (Arbitrary)	Injects dependencies through any method

## 🧪 Implementations of @Autowired with Examples
### 1. Field Injection
```java
@Component
public class Car {

    @Autowired
    private Engine engine;

    public void start() {
        engine.run();
    }
}
```
🔴 Not recommended for unit testing and immutability.

### 2. Setter Injection
```java

@Component
public class Car {

    private Engine engine;

    @Autowired
    public void setEngine(Engine engine) {
        this.engine = engine;
    }
}
``` 
✅ Testable and allows optional injection.

### 3. Constructor Injection (Recommended)
```java

@Component
public class Car {

    private final Engine engine;

    @Autowired
    public Car(Engine engine) {
        this.engine = engine;
    }
}
```

✅ Best practice. Ensures dependencies are provided and object is immutable.

### 4. Method Injection
```java

@Component
public class Car {

    private Engine engine;

    @Autowired
    public void configureEngine(Engine engine) {
        this.engine = engine;
    }
}
```
⚠️ Rarely used, but valid for multiple injections in a single method.

## 🔁 Behavior of @Autowired
Scenario	Behavior
Bean is available	Injected automatically
Multiple matching beans	Requires @Qualifier
No bean found (by default)	Throws NoSuchBeanDefinitionException
Optional injection	Use @Autowired(required = false)

```java

@Autowired(required = false)
private TurboCharger turbo;
```
🏷️ Using @Qualifier with @Autowired
When multiple beans of the same type exist:

```java

@Component("v8Engine")
public class V8Engine implements Engine {}

@Component("v6Engine")
public class V6Engine implements Engine {}

@Component
public class Car {

    @Autowired
    @Qualifier("v6Engine")
    private Engine engine;
}
```
### 🧪 Example with Spring Boot Setup
```java
@SpringBootApplication
public class DemoApp {
    public static void main(String[] args) {
        ApplicationContext ctx = SpringApplication.run(DemoApp.class, args);
        Car car = ctx.getBean(Car.class);
        car.start();
    }
}
```

### 📌 Summary
Injection Type	Testable	Best Practice	Notes
Field Injection	❌	❌	Quick, but not clean
Setter Injection	✅	✅	Optional injection
Constructor Injection	✅	✅✅✅	Preferred method
Method Injection	✅	⚠️	Use for grouped dependencies
