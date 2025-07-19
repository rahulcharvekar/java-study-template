## 🔷 What is a Thread in Java?
A thread is a lightweight subprocess — the smallest unit of execution in a program. Java supports multithreading, which allows multiple threads to run concurrently, enabling better CPU utilization and responsiveness.

## 🔷 Key Concepts
1. Process vs Thread
Process	Thread
Independent execution unit	Subset of a process
Has its own memory space	Shares memory with other threads
Heavier	Lightweight
Inter-process communication is complex	Communication is easier

## 🔷 Thread Lifecycle
New – Thread is created.

Runnable – Thread is ready to run but waiting for CPU.

Running – Thread is executing.

Blocked/Waiting – Thread is waiting for a resource or signal.

Terminated – Thread has completed execution or stopped.

📌 Java manages these states internally via the Thread Scheduler.

## 🔷 How to Create Threads
### ✅ Method 1: Extending Thread Class
```java
class MyThread extends Thread {
    public void run() {
        System.out.println("Thread running: " + Thread.currentThread().getName());
    }
}

public class Main {
    public static void main(String[] args) {
        MyThread t1 = new MyThread();
        t1.start(); // don't use t1.run() directly
    }
}
```

### ✅ Method 2: Implementing Runnable Interface
```java
class MyRunnable implements Runnable {
    public void run() {
        System.out.println("Runnable thread: " + Thread.currentThread().getName());
    }
}

public class Main {
    public static void main(String[] args) {
        Thread t1 = new Thread(new MyRunnable());
        t1.start();
    }
}
```

### ✅ Method 3: Using Lambda Expression (Java 8+)
```java
public class Main {
    public static void main(String[] args) {
        Thread t1 = new Thread(() -> System.out.println("Lambda thread: " + Thread.currentThread().getName()));
        t1.start();
    }
}
```

## 🔷 Thread Methods
Method	Description
start()	Starts a new thread
run()	Contains code to execute
sleep(ms)	Pauses the thread for given milliseconds
join()	Waits for thread to finish
setPriority()	Sets thread priority
setDaemon(true)	Marks thread as daemon
interrupt()	Interrupts the thread

### 🔷 Example: Multiple Threads
```java
class PrintNumbers implements Runnable {
    public void run() {
        for (int i = 1; i <= 5; i++) {
            System.out.println(Thread.currentThread().getName() + " - " + i);
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Thread t1 = new Thread(new PrintNumbers(), "Thread-1");
        Thread t2 = new Thread(new PrintNumbers(), "Thread-2");
        t1.start();
        t2.start();
    }
}
```

## 🔷 Synchronization
To prevent race conditions, use synchronized keyword.

```java
class Counter {
    private int count = 0;

    public synchronized void increment() {
        count++;
    }

    public int getCount() {
        return count;
    }
}

public class Main {
    public static void main(String[] args) throws InterruptedException {
        Counter counter = new Counter();

        Runnable task = () -> {
            for (int i = 0; i < 1000; i++)
                counter.increment();
        };

        Thread t1 = new Thread(task);
        Thread t2 = new Thread(task);
        t1.start();
        t2.start();

        t1.join();
        t2.join();

        System.out.println("Final count: " + counter.getCount());
    }
}
```

## 🔷 Daemon Threads
Daemon threads are background threads (e.g., Garbage Collector).

```java
Thread t = new Thread(() -> {
    while (true) {
        System.out.println("Daemon running...");
        try { Thread.sleep(1000); } catch (InterruptedException e) {}
    }
});
t.setDaemon(true);
t.start();
```

## 🔷 Thread Pools (ExecutorService)
Better than manually creating threads repeatedly.

```java
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Main {
    public static void main(String[] args) {
        ExecutorService executor = Executors.newFixedThreadPool(3);

        Runnable task = () -> System.out.println("Task executed by: " + Thread.currentThread().getName());

        for (int i = 0; i < 5; i++)
            executor.execute(task);

        executor.shutdown();
    }
}
```

## 🔷 Real-World Analogy
Imagine a restaurant:

The chef is like a thread (handling one task at a time).

The kitchen is the process (shared by all chefs).

Multiple chefs (threads) can cook different orders (tasks) simultaneously, sharing kitchen tools (resources).

Synchronization is like giving access to one chef at a time to the oven to avoid conflict.

## 🔷 Summary
Concept	Purpose
Thread	Independent execution unit in a process
Runnable	Functional interface for thread logic
Synchronization	Prevents race conditions
Thread Pool	Efficient thread reuse
Daemon Thread	Background supporting threads
sleep/join/start	Controls execution timing
