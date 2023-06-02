#! /bin/bash -

#SBATCH --job-name=jupyter_server
#SBATCH --output=/fh/fast/setty_m/user/kfeldman/jupyter_logs/%x_job-%j_%N.log
#SBATCH --mem=300G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=10-00:00:00

envName="$1"

# make sure the module system is loaded
source /etc/profile.d/modules.sh
# make sure conda init code is run
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
# enter the jupyter server environment
conda activate "$envName"

# limit threads for numpy
export MKL_NUM_THREADS=$SLURM_CPUS_PER_TASK
export NUMEXPR_MAX_THREADS=$SLURM_CPUS_PER_TASK
export NUMEXPR_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

jupyter lab --ip=$(hostname) --port=47100 --no-browser
