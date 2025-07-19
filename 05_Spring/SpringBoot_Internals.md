Here's an **internal explanation of how Spring Boot works** — covering its architecture, core components, and how it simplifies Java application development.

---

### 🧩 **What Is Spring Boot?**

Spring Boot is an extension of the **Spring Framework** designed to **simplify the setup, configuration, and deployment** of Spring applications by:

* Eliminating boilerplate code
* Providing embedded servers (Tomcat, Jetty)
* Using opinionated defaults and auto-configuration
* Supporting microservices and REST APIs

---

## ⚙️ Internal Working of Spring Boot

Let’s break it down into key components and flow:

---

### 1. 🧪 **Spring Boot Starter (Dependencies)**

* Spring Boot uses **starter POMs** to include a bundle of commonly used dependencies.
* For example: `spring-boot-starter-web` pulls in Spring MVC, Tomcat, Jackson, etc.

```xml
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-web</artifactId>
</dependency>
```

---

### 2. 🏗️ **Auto Configuration**

* **@SpringBootApplication** is a shortcut for:

  * `@Configuration`
  * `@EnableAutoConfiguration`
  * `@ComponentScan`

#### 🔍 `@EnableAutoConfiguration`

* This tells Spring Boot to **guess configuration** based on the dependencies present in the classpath.

📦 Example:

* If `spring-webmvc` is on the classpath, Spring Boot automatically configures:

  * DispatcherServlet
  * ViewResolver
  * WebMvcConfigurer

🔧 Uses `spring.factories`:

```properties
org.springframework.boot.autoconfigure.EnableAutoConfiguration=\
org.springframework.boot.autoconfigure.web.servlet.WebMvcAutoConfiguration,\
org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration
```

---

### 3. 🛠️ **Component Scan & Dependency Injection**

* `@ComponentScan` scans the current package and sub-packages for:

  * `@Component`
  * `@Service`
  * `@Repository`
  * `@Controller`

🧠 These beans are then registered in the Spring Context using dependency injection (IoC container).

---

### 4. 🚀 **Embedded Server**

* By default, Spring Boot starts an **embedded Tomcat server** (or Jetty/Undertow).
* No need to deploy WAR files to an external server.

🧪 This is enabled by `spring-boot-starter-web` which pulls in `spring-boot-starter-tomcat`.

```java
@SpringBootApplication
public class DemoApplication {
    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args); // Bootstraps the app
    }
}
```

🧠 Internally, `SpringApplication`:

* Creates the application context
* Sets up environment
* Instantiates the embedded server
* Loads beans
* Starts the app

---

### 5. 📂 **External Configuration**

* Spring Boot uses **`application.properties` or `application.yml`** for external configuration.

You can override:

* Ports
* DB configs
* Log levels
* Custom properties

```properties
server.port=8081
spring.datasource.url=jdbc:mysql://localhost/db
```

Spring Boot follows **hierarchical config resolution** from:

* Command line args
* Environment variables
* Application properties
* Default values

---

### 6. 🔄 **Spring Boot DevTools**

* Auto-restart on code change
* Live reload for front-end changes
* Developer-friendly settings

---

### 7. 🧪 **Actuator (Optional)**

* Adds production-ready features like:

  * `/actuator/health`
  * `/actuator/metrics`
  * `/actuator/env`

You just need to add:

```xml
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
```

---

### 🔄 Summary Flow Diagram

```
@SpringBootApplication
        |
        ↓
@EnableAutoConfiguration → Checks spring.factories for available configs
        ↓
@ComponentScan → Scans and registers beans
        ↓
SpringApplication.run() → Creates context + Embedded Tomcat
        ↓
Application is up and running on port 8080
```

---
