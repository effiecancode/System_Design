import concurrent.futures
import math

def calculate_pi(n):
    sum_of_series = 0
    for k in range(n):
        term = 4 * ((-1)**k) / (2*k + 1)
        sum_of_series += term
    return sum_of_series

def main():
    n = 10000000
    with concurrent.futures.ProcessPoolExecutor(max_workers=4) as executor:
        future = executor.submit(calculate_pi, n)
        pi_approximation = future.result()

    print(f"Approximate of pi: {pi_approximation}")

if __name__ == "__main__":
    main()

# this code leverages multiple cores for CPU-bound computations
# running in a single process

# the value of π using the Gregory-Leibniz series,
# and it leverages Python's concurrent.futures.ProcessPoolExecutor
# to execute the computation in parallel.