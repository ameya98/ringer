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

evaluate \
    --model-dir /homefs/home/daigavaa/ringer/results \
    --data-dir /data/bucket/kleinhej/cremp-preprocessed-ringer/test \
    --split-sizes 0.0 0.0 1.0 \
    --sample-only
