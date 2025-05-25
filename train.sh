#!/usr/bin/env bash

#SBATCH --partition gpu2
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 2
#SBATCH --gpus-per-node 1
#SBATCH --cpus-per-task 16
#SBATCH --mem 512G
#SBATCH --time 3-0

eval "$(conda shell.bash hook)"
conda activate ringer

set -eux

echo "SLURM_JOB_ID = ${SLURM_JOB_ID}"
echo "hostname = $(hostname)"

# Create random name for the run
export RANDOM_NAME=$(echo $RANDOM | md5sum | head -c 10)
train conditional.json --wandb-run ${RANDOM_NAME}
