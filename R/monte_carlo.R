library(future.apply)

# Set up parallelization plan (assuming you want to use multisession for parallelism)
plan(multisession)

DIR <- "simulation_results"

simulate_and_save <- function(m, parameter_one, parameter_two) {
  set.seed(m)
  result <- parameter_one + parameter_two + rnorm(1, 0, 1)
  
  # Ensure the directory exists
  if(!dir.exists(DIR)) {
    dir.create(DIR, recursive = TRUE)
  }
  
  # Save results to csv
  write.csv(result, file = paste0(DIR, "/results_", m, ".csv"), row.names = FALSE)
  return(paste("Simulation", m, "saved."))
}

main <- function() {
  parameter_one <- 1
  parameter_two <- 2
  
  # Number of simulations
  num_simulations <- 64
  
  # Run simulations in parallel
  results <- future_lapply(1:num_simulations, function(m) simulate_and_save(m, parameter_one, parameter_two), future.seed = TRUE)
  
  print(results)
}

# Run the main function
main()
