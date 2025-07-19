In Java, I/O (Input/Output) is a fundamental concept used to read data from input sources (like keyboard, file, network) and write data to output destinations (like console, file, network). Java I/O is organized primarily under the java.io, java.nio, and java.util packages.

Here's a structured breakdown of all key aspects of Java I/O with examples and comparisons:

## 🔸 1. Streams: Byte vs Character
Aspect	Byte Streams	Character Streams
Class	InputStream / OutputStream	Reader / Writer
Use case	Binary data (images, audio, etc.)	Text data (char, String)
Encoding	No encoding handled	Handles character encoding

Example:
### Byte Stream:

```java
FileInputStream fis = new FileInputStream("image.jpg");
FileOutputStream fos = new FileOutputStream("copy.jpg");

int b;
while ((b = fis.read()) != -1) {
    fos.write(b);
}
fis.close();
fos.close();
```

### Character Stream:

```java
FileReader fr = new FileReader("input.txt");
FileWriter fw = new FileWriter("output.txt");

int c;
while ((c = fr.read()) != -1) {
    fw.write(c);
}
fr.close();
fw.close();
```

## 🔸 2. File I/O
Java provides the File class for basic file operations (create, delete, check).

Example:
```java
File file = new File("example.txt");
if (file.createNewFile()) {
    System.out.println("File created.");
}
FileReader / BufferedReader: Reading text

FileWriter / BufferedWriter: Writing text
```

## 🔸 3. Buffered Streams
Type	Purpose
BufferedReader / BufferedWriter	Improve performance for text-based I/O
BufferedInputStream / BufferedOutputStream	Improve performance for binary I/O

Example:
```java
BufferedReader br = new BufferedReader(new FileReader("input.txt"));
String line;
while ((line = br.readLine()) != null) {
    System.out.println(line);
}
br.close();
```

### ✅ Advantage: Reduces I/O operations by using a buffer.

## 🔸 4. Data Streams
Used to read/write primitive types and String in binary format.

Class	Description
DataInputStream / DataOutputStream	Read/write primitive data (int, float, etc.)

Example:
```java
DataOutputStream dos = new DataOutputStream(new FileOutputStream("data.dat"));
dos.writeInt(42);
dos.writeDouble(3.14);
dos.close();

DataInputStream dis = new DataInputStream(new FileInputStream("data.dat"));
int i = dis.readInt();
double d = dis.readDouble();
System.out.println(i + " " + d);
dis.close();
```

## 🔸 5. Object Streams (Serialization)
Class	Description
ObjectOutputStream / ObjectInputStream	For serializing/deserializing Java objects

Example:
```java
class Person implements Serializable {
    String name;
    int age;
}

Person p = new Person();
p.name = "Alice";
p.age = 30;

ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("person.ser"));
oos.writeObject(p);
oos.close();

ObjectInputStream ois = new ObjectInputStream(new FileInputStream("person.ser"));
Person read = (Person) ois.readObject();
System.out.println(read.name + " " + read.age);
ois.close();
```

### 🟨 Requires: Class must implement Serializable.

## 🔸 6. Scanner vs BufferedReader

Both `Scanner` and `BufferedReader` are used for reading input from various sources (like `System.in` or files), but they serve different purposes and have different performance characteristics.

### 📊 Comparison Table

| Feature              | `Scanner`                        | `BufferedReader`                   |
|----------------------|----------------------------------|------------------------------------|
| Input type           | Token-based                      | Line-based                         |
| Parsing capabilities | Built-in (e.g., `nextInt()`)     | Manual parsing needed              |
| Performance          | Slower (due to regex parsing)    | Faster                             |
| Exception handling   | Handles input mismatch exceptions| Must handle `IOException`          |
| Flexibility          | Easy for simple input tasks      | Better for large data or line reads|
| Common use cases     | User input from console          | Reading large text files           |

### ✅ When to Use

- Use **`Scanner`** when:
  - You need to parse primitive types directly.
  - You’re building quick console-based apps.

- Use **`BufferedReader`** when:
  - Performance is a priority.
  - You need to read large files or text data efficiently.

### 📌 Example: Scanner

```java
import java.util.Scanner;

Scanner sc = new Scanner(System.in);
System.out.print("Enter an integer: ");
int number = sc.nextInt();
System.out.println("You entered: " + number);


## 🔸 7. Console I/O
Used for secure console input (like passwords).

```java
Console console = System.console();
String username = console.readLine("Enter username: ");
char[] password = console.readPassword("Enter password: ");
```
🟩 Note: Works only in interactive terminals, not in IDEs.

## 🔸 8. Java NIO (Non-blocking I/O)

Java NIO (`java.nio` package) is designed for scalable, high-performance I/O. It supports non-blocking, buffer-oriented, and channel-based operations.

### Key Features

| Feature         | `java.io`               | `java.nio`                         |
|-----------------|-------------------------|------------------------------------|
| Blocking        | Yes                     | No                                 |
| Buffer-oriented | No                      | Yes                                |
| Channels        | No                      | Yes                                |
| Selectors       | No                      | Yes (handle multiple channels)     |
| Suitable for    | Simple I/O              | High-performance, async I/O        |

### Example: Reading a File with NIO

```java
import java.nio.file.*;
import java.util.List;

Path path = Paths.get("input.txt");
List<String> lines = Files.readAllLines(path);
lines.forEach(System.out::println);


Example:
```java
Path path = Paths.get("input.txt");
List<String> lines = Files.readAllLines(path);
```

Or using NIO Channels:

```java
FileChannel channel = FileChannel.open(Paths.get("file.txt"), StandardOpenOption.READ);
ByteBuffer buffer = ByteBuffer.allocate(1024);
channel.read(buffer);
```

## 🔸 9. Standard I/O Streams
Java provides 3 predefined streams:

System.in (InputStream)

System.out (PrintStream)

System.err (PrintStream)

Example:
```java
System.out.println("Hello");
System.err.println("Error message");
```

## 🔸 10. Difference Summary Table

| Feature          | `java.io`                      | `java.nio`                          |
|------------------|--------------------------------|-------------------------------------|
| Blocking         | Yes                            | No                                  |
| Buffer-oriented  | No (stream-based)              | Yes (buffer-based)                  |
| Channels         | No                             | Yes                                 |
| Selectors        | No                             | Yes (for multiplexing channels)     |
| Read/write style | Sequential                     | Random access and multiplexed       |
| Performance      | Suitable for simple I/O tasks  | Better for high-performance tasks   |
| File support     | `File`, `FileInputStream` etc. | `Path`, `Files`, `FileChannel` etc. |
| Suitable for     | Small-scale file/console I/O   | Scalable systems, network servers   |


## ✅ When to Use What?

| Use Case                           | Recommended API                          |
|------------------------------------|------------------------------------------|
| Read/write text files              | `BufferedReader`, `BufferedWriter`       |
| Read/write binary files            | `FileInputStream`, `FileOutputStream`    |
| Handle primitive types             | `DataInputStream`, `DataOutputStream`    |
| Save/load objects (serialization) | `ObjectInputStream`, `ObjectOutputStream`|
| High-speed or non-blocking I/O     | `java.nio` (Channels + Buffers)          |
| Line or token input from console   | `Scanner` or `BufferedReader`            |
| Secure input (e.g., passwords)     | `Console.readPassword()`                 |
| File operations (create/delete)    | `File`, `Files`, `Path` APIs             |
