import os
import numpy as np
from concurrent.futures import ProcessPoolExecutor

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

    for m in range(num_simulations):
        simulate_and_save(m, paramter_one, paramter_two)

if __name__ == "__main__":
    main()
