

# 🔷 What is Stream API in Java?

Java Stream API (introduced in Java 8) provides a functional-style way to process sequences of elements (like collections). It’s not about storing data but about describing computations on data.

Streams let you:
	•	Filter, map, and reduce data
	•	Chain operations
	•	Write concise and readable code

⸻

# 🔧 Key Concepts

Concept	Meaning
Stream	A sequence of elements supporting sequential and parallel operations
Intermediate Operation	Returns another stream (e.g. filter, map, sorted)
Terminal Operation	Produces a result (e.g. collect, forEach, count)


⸻

## ✅ Example 1: Basic Stream with forEach

```java
import java.util.Arrays;
import java.util.List;

public class StreamExample {
    public static void main(String[] args) {
        List<String> names = Arrays.asList("Ankita", "John", "Jane", "Alex");

        // Print all names
        names.stream()
             .forEach(System.out::println);
    }
}
```

⸻

## ✅ Example 2: Filtering with filter
```java
List<String> names = Arrays.asList("Ankita", "John", "Jane", "Alex");

// Print names starting with "J"
names.stream()
     .filter(name -> name.startsWith("J"))
     .forEach(System.out::println);
```

⸻

## ✅ Example 3: Mapping with map
```java
List<String> names = Arrays.asList("Ankita", "John", "Jane");

// Convert all names to uppercase
names.stream()
     .map(String::toUpperCase)
     .forEach(System.out::println);
```

⸻

## ✅ Example 4: Sorting with sorted
```java
List<Integer> numbers = Arrays.asList(5, 3, 1, 4, 2);

// Sort and print
numbers.stream()
       .sorted()
       .forEach(System.out::println);
```

⸻

## ✅ Example 5: Collecting with collect
```java
import java.util.stream.Collectors;

List<String> names = Arrays.asList("Ankita", "John", "Jane", "Alex");

// Get names in uppercase into a list
List<String> upperNames = names.stream()
                               .map(String::toUpperCase)
                               .collect(Collectors.toList());

System.out.println(upperNames); // [ANKITA, JOHN, JANE, ALEX]
```

⸻

## ✅ Example 6: Reduce (Summing numbers)
```java
List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);

int sum = numbers.stream()
                 .reduce(0, Integer::sum);

System.out.println("Sum = " + sum); // Sum = 15
```

⸻

# 🧠 Real-world Analogy

Think of a stream as a pipeline. Imagine you have a conveyor belt:
	1.	filter() removes unwanted items.
	2.	map() transforms items.
	3.	collect() gathers the result.

⸻

# 📝 Notes
	•	Streams are lazy: Nothing happens until a terminal operation is invoked.
	•	Streams can be parallel: parallelStream() can speed up operations using multiple threads.
	•	Streams are not reusable: Once consumed, you can’t use the same stream again.

⸻

