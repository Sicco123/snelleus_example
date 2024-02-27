
DIR <- "simulation_results"

simulate_and_save <- function(m, parameter_one, parameter_two) {
  set.seed(m)
  result <- parameter_one + parameter_two + rnorm(1, 0, 1)
  
  # Save results to csv
  write.csv(result, file = paste0(DIR, "/results_", m, ".csv"), row.names = FALSE)
  return(paste("Simulation", m, "saved."))
}

main <- function() {
  parameter_one <- 1
  parameter_two <- 2
  
  # Number of simulations
  num_simulations <- 64
  
  # Ensure the directory exists before the loop
  if(!dir.exists(DIR)) {
    dir.create(DIR, recursive = TRUE)
  }
  
  # Run simulations sequentially using a for loop
  results <- vector("list", num_simulations) # Pre-allocate storage for results
  for (m in 1:num_simulations) {
    results[[m]] <- simulate_and_save(m, parameter_one, parameter_two)
  }
  
  print(results)
}

# Run the main function
main()
