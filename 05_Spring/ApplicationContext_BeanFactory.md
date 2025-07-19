# 🧠 ApplicationContext vs. BeanFactory in Spring
## 📘 Overview
Feature	BeanFactory	ApplicationContext
Type	Interface	Interface (extends BeanFactory)
Package	org.springframework.beans.factory	org.springframework.context
Purpose	Basic container for bean management	Advanced container with more features
Initialization	Lazy (beans are created when requested)	Eager (beans are created at startup)
Internationalization	❌ Not supported	✅ Supported via MessageSource
Event handling	❌ Not supported	✅ Supports ApplicationEvent handling
Annotation support	❌ Limited or manual	✅ Full support (e.g., @Autowired)
AOP integration	❌ Manual	✅ Seamless integration
Use case	Lightweight applications or testing	Full-fledged enterprise Spring apps

## 🏗 Key Differences Explained
1. Bean Loading
BeanFactory loads beans lazily (on demand).

ApplicationContext loads beans eagerly (at startup).

2. Internationalization
Only ApplicationContext supports i18n using ResourceBundleMessageSource.

3. Event Publishing
Only ApplicationContext supports event propagation (ApplicationEventPublisher).

4. Enterprise Features
ApplicationContext integrates with Spring AOP, Spring Expression Language (SpEL), environment abstraction, etc.

## ✅ When to Use What?
Use BeanFactory when:

You want minimal resource usage.

You’re working in constrained environments (like mobile or IoT).

You want to delay bean creation for performance.

Use ApplicationContext when:

You need advanced features (events, AOP, annotations).

You're developing typical Spring web/enterprise applications.

## 🧪 Code Example
```java

// Using BeanFactory
Resource resource = new ClassPathResource("beans.xml");
BeanFactory factory = new XmlBeanFactory(resource);
MyBean bean = (MyBean) factory.getBean("myBean");

// Using ApplicationContext
ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
MyBean bean = context.getBean("myBean", MyBean.class);
```
