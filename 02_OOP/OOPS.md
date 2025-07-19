
# Java OOPs Concepts with Real-time and Project Examples

Object-Oriented Programming (OOP) in Java consists of the following core concepts:

---

## 1. **Class**
- **Definition**: A blueprint for creating objects.
- **Real-time Example**: A "Car" blueprint.
- **Project Example**: `Employee` class in an HR management system.
```java
public class Employee {
    String name;
    int id;
    double salary;

    public void displayDetails() {
        System.out.println("ID: " + id + ", Name: " + name);
    }
}
```

---

## 2. **Object**
- **Definition**: An instance of a class.
- **Real-time Example**: My car (object) from Car class.
- **Project Example**:
```java
Employee emp = new Employee();
emp.name = "John";
emp.id = 101;
emp.salary = 50000;
emp.displayDetails();
```

---

## 3. **Inheritance**
- **Definition**: One class acquires properties of another.
- **Real-time Example**: Dog is an Animal.
- **Project Example**: `Manager` inherits from `Employee`.
```java
public class Manager extends Employee {
    int teamSize;

    public void showTeamSize() {
        System.out.println("Team Size: " + teamSize);
    }
}
```

---

## 4. **Encapsulation**
- **Definition**: Wrapping data and code into a single unit (class) and restricting access using access modifiers.
- **Real-time Example**: Medical capsule.
- **Project Example**:
```java
public class Account {
    private double balance;

    public double getBalance() {
        return balance;
    }

    public void deposit(double amount) {
        if (amount > 0) balance += amount;
    }
}
```

---

## 5. **Polymorphism**
- **Definition**: One interface, many implementations.
- **Types**: Compile-time (method overloading) and Run-time (method overriding).
- **Real-time Example**: A person behaves differently in office and home.
- **Project Example**:
```java
// Overloading
public class Calculator {
    int add(int a, int b) {
        return a + b;
    }

    double add(double a, double b) {
        return a + b;
    }
}

// Overriding
public class Employee {
    void work() {
        System.out.println("Working");
    }
}

public class Developer extends Employee {
    void work() {
        System.out.println("Developing software");
    }
}
```

---

## 6. **Abstraction**
- **Definition**: Hiding internal details and showing only functionality.
- **Real-time Example**: Driving a car without knowing internal mechanics.
- **Project Example**:
```java
abstract class Shape {
    abstract void draw();
}

class Circle extends Shape {
    void draw() {
        System.out.println("Drawing Circle");
    }
}
```

---

## 7. **Association**
- **Definition**: Relationship between classes.
- **Types**: One-to-One, One-to-Many, Many-to-Many.
- **Project Example**:
```java
class Department {
    String name;
}

class Employee {
    Department dept; // Association
}
```

---

## 8. **Aggregation**
- **Definition**: "Has-A" relationship (weaker than composition).
- **Real-time Example**: University has Departments.
- **Project Example**:
```java
class Department {
    String name;
}

class University {
    Department dept; // Aggregation
}
```

---

## 9. **Composition**
- **Definition**: Strong containment (lifetime dependency).
- **Real-time Example**: Human has a heart.
- **Project Example**:
```java
class Engine {
    String type;
}

class Car {
    private final Engine engine = new Engine(); // Composition
}
```

---

Each concept contributes to writing clean, modular, and maintainable code in real-world applications.

