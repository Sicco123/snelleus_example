#!/bin/bash -l
#SBATCH --job-name=test
#SBATCH --output=%x.out
#SBATCH --partition=genoa
#SBATCH --nodes=1
#SBATCH --ntasks=64 # Must be equal to task_size 
#SBATCH --cpus-per-task=1
#SBATCH --mail-user=[EMAIL]
#SBATCH --mail-type=end,fail
#SBATCH --time=00:01:00  

echo "== Starting run at $(date)"
echo "== Job ID: ${SLURM_JOBID}"
echo "== Node list: ${SLURM_NODELIST}"
echo "== Submit dir. : ${SLURM_SUBMIT_DIR}"
echo "== Scratch dir. : ${TMPDIR}"

# environment modules
module load 2022 SciPy-bundle/2022.05-foss-2022a

# Set home directory
cd $HOME/test
    
python monte_carlo.py  

wait



