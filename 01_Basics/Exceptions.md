## 🔹 Types of Exceptions
Java has a well-structured exception hierarchy. At the top is the Throwable class, which splits into:

## Exception (checked & unchecked)

Error (serious problems like OutOfMemoryError, usually not handled by programs)

### 1. Checked Exceptions
Must be either caught or declared in the method signature.

Checked at compile-time.

Examples:

IOException

SQLException

FileNotFoundException

```java
public void readFile() throws IOException {
    FileReader file = new FileReader("data.txt");
}
```

### 2. Unchecked Exceptions
Don't need to be declared or caught.

Checked at runtime.

Examples:

NullPointerException

ArithmeticException

ArrayIndexOutOfBoundsException

```java
int x = 10 / 0; // Throws ArithmeticException
```


🔹 Try-Catch-Finally Structure
```java
try {
    int[] arr = new int[5];
    System.out.println(arr[10]); // May throw exception
} catch (ArrayIndexOutOfBoundsException e) {
    System.out.println("Invalid array index: " + e.getMessage());
} finally {
    System.out.println("This block always executes");
}
```

try: Code that might throw an exception.

catch: Handles the exception.

finally: Always executes (cleanup code).

### 🔹 Throw vs Throws
throw: Used to explicitly throw an exception.

throws: Declares the exception a method might throw.

```java
public void checkAge(int age) {
    if (age < 18) {
        throw new IllegalArgumentException("Age must be 18+");
    }
}
```

### 🔹 Custom Exceptions
You can create your own exception class:

```java
\class MyException extends Exception {
    public MyException(String message) {
        super(message);
    }
}
```

```java
public void validate(int score) throws MyException {
    if (score < 0) {
        throw new MyException("Score cannot be negative");
    }
}
```

### 🔹 Real-World Analogy
Imagine you're withdrawing money from an ATM:

Exception: Not enough funds

Try: You attempt withdrawal

Catch: ATM displays "Insufficient funds"

Finally: ATM returns your card
