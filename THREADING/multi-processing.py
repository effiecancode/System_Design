from multiprocessing import pool
import time

def square(x):
    numbers = [1,2,3,4,5]
    start_time = time.time()

    # pool of worker processes
    p = pool(processes = 4)

    # map function to the input list
    result = p.map(square, numbers)

    # close the pool and wait for all workers to finish
    p.close()
    p.join()

    end_time = time.time()
    print("Result:", result)
    print("Time taken: ", end_time - start_time, "seconds")

# This code demonstrates how to perform CPU-intensive tasks in
# parallel using multiple processes .