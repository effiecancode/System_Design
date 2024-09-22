import threading
import random
import time

def worker(name: str) -> None:
    print(f"Started worker {name}")
    worker_time = random.choice(range(1, 5))
    time.sleep(worker_time)
    print(f"{name} worker finished in {worker_time}")

if __name__ == '__main__':
    threads = []
    for i in range(5):
        thread = threading.Thread(
            target=worker,
            args=(f"computer_{i}", ),
        )
        thread.start()
        threads.append(thread)

    # wait for all threads to complete
    for t in threads:
        t.join()

    print("All workers have finished.")

"""
- the code creates 5 threads, each calling the worker function with a unique name.
- Each thread runs independently, allowing for concurrent execution [0].
- Random simulation of tasks with varying durations as in real-world scenarios
- Thread management using a list[]
- effective utilization of CPU cores as each thread run concurrently
- If shared resources were involved, consider implementing synchronization
mechanisms like locks to prevent race conditions

"""