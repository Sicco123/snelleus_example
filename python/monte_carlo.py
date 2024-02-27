from concurrent.futures import ProcessPoolExecutor
import os
import numpy as np

DIR = "simulation_results"

def simulate_and_save(m, paramter_one, paramter_two):
    # Simulate data and run model

    # Here, you would replace this with actual simulation code
    # For demonstration, we will just add two parameters and some random noise
    np.random.seed(m)
    result = paramter_one + paramter_two + np.random.normal(0, 1, 1)
    
    # Save results to csv
    np.savetxt(f"{DIR}/results_{m}.csv", result, delimiter=",")
    return f"Simulation {m} saved."

def main():
    paramter_one = 1
    paramter_two = 2
    
    # Number of simulations
    num_simulations = 64
    
    # Ensure the directory exists
    if not os.path.exists(DIR):
        os.makedirs(DIR, exist_ok=True)

    # Define the number of cores/processes to use
    num_cores = 4  # For example, to use 4 cores

    # Using ProcessPoolExecutor to run simulations in parallel
    with ProcessPoolExecutor(max_workers=num_cores) as executor:
        futures = [executor.submit(simulate_and_save, m, paramter_one, paramter_two) for m in range(num_simulations)]
        
        # Optionally, you can collect and print/log the return values from your simulations
        for future in futures:
            print(future.result())

if __name__ == "__main__":
    main()
