#!/bin/bash
#SBATCH -J rf
#SBATCH -A ccsi
#SBATCH -p batch
#SBATCH -N 1
#SBATCH -c 32
#SBATCH --mem=0
#SBATCH -t 00:10:00
#SBATCH -e ./rf.e
#SBATCH -o ./rf.o

## above we request 4 nodes and all memory on the nodes

cd ~/R4HPC/code_2
pwd

## modules are specific to or-slurm-login.ornl.gov (CADES SHPC condos)
source /software/cades-open/spack-envs/base/root/linux-centos7-x86_64/gcc-6.3.0/lmod-8.5.6-wdngv4jylfvg2j6jt7xrtugxggh5lpm5/lmod/lmod/init/bash
export MODULEPATH=/software/cades-open/spack-envs/base/modules/site/Core:/software/cades-open/modulefiles/core
module load gcc
module load openmpi
#module load r/4.1.0-py3-X-flexiblas 
module load r/4.1.0-py3-X
echo "loaded R"
module list

time Rscript rf_serial.R
time Rscript rf_mc.R --args 1
time Rscript rf_mc.R --args 2
time Rscript rf_mc.R --args 4
time Rscript rf_mc.R --args 8
time Rscript rf_mc.R --args 16
time Rscript rf_mc.R --args 32
time Rscript rf_mc.R --args 64

