#!/bin/bash 
 
#SBATCH -p gpuk 
#SBATCH --gres=gpu:1 
#SBATCH -J 1smd-sensor_164-180_pH7_EF5.5264e-5 
#SBATCH -o 1smd-sensor_164-180_pH7_EF5.5264e-5-%j.out 
#SBATCH -e 1smd-sensor_164-180_pH7_EF5.5264e-5-%j.err 
#SBATCH --mem=2G 
#SBATCH --time=55:00:00 
#SBATCH --mail-user=sergio.urzua.13@sansano.usm.cl 
#SBATCH --mail-type=BEGIN,END,FAIL 
 
use cuda10 
use anaconda3 
 
export PYTHONPATH=/user/s/surzua/PyCuda/pycuda/lib/python 
cd ../../amylase_pygbe_pH7/ 
 
echo "Simulación que contempla las siguientes Orientaciones:" 
echo "Tilt begin: 164° - Tilt_end: 180° - Ntilt: 5 -- Rot begin: 0° - Rot end: 360° - Nrot: 36" 
echo "...................................................................................." 
echo "Proteina-Superficie: Amilasa - Surf Cargada -0.04 C/m^2." 
echo "Separación: 2 Angstrom" 
 
python generador_config_file.py 1smd_sensor 1smd_mod geometry/1smd_d08_split 164 180 2 
 
echo "Se ha Creado Config File Auxiliar" 
echo "Comenzo Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando" 
echo "%%%%%%%% Simulando %%%%%%%%" 
 
python conformation_1hel.py 1smd_sensor 1smd_sensor/1smd_mod 1smd_sensor/geometry/1smd_d08_split 164 180 5 2 1smd-sensor_164-180-2_EF5.5264e-5 
 
echo "Termino Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando" 
