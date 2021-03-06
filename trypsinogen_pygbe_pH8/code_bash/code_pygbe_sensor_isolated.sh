#!/bin/bash

#SBATCH -p gpuk
#SBATCH --gres=gpu:1
#SBATCH -J sensor_isolated_EF1e-12
#SBATCH -o sensor_isolated_EF1e-12-%j.out
#SBATCH -e sensor_isolated_EF1e-12-%j.err
#SBATCH --mem=2G
#SBATCH --time=01:00:00
#SBATCH --mail-user=sergio.urzua.13@sansano.usm.cl
#SBATCH --mail-type=BEGIN,END,FAIL

use cuda10
use anaconda3

export PYTHONPATH=/user/s/surzua/PyCuda/pycuda/lib/python

cd ../../trypsin_pygbe_pH8/

/user/s/surzua/PyCuda/pycuda/bin/pygbe sensor_isolated/
