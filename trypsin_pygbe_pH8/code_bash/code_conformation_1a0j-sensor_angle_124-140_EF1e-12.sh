#!/bin/bash 
 
#SBATCH -p gpuk 
#SBATCH --gres=gpu:1 
#SBATCH -J 1a0j-sensor_124-140_pH8_EF1e-12 
#SBATCH -o 1a0j-sensor_124-140_pH8_EF1e-12-%j.out 
#SBATCH -e 1a0j-sensor_124-140_pH8_EF1e-12-%j.err 
#SBATCH --mem=2G 
#SBATCH --time=55:00:00 
#SBATCH --mail-user=sergio.urzua.13@sansano.usm.cl 
#SBATCH --mail-type=BEGIN,END,FAIL 
 
use cuda10 
use anaconda3 
 
export PYTHONPATH=/user/s/surzua/PyCuda/pycuda/lib/python 
cd ../../trypsin_pygbe_pH8/ 
 
echo "Simulación que contempla las siguientes Orientaciones:" 
echo "Tilt begin: 124° - Tilt_end: 140° - Ntilt: 5 -- Rot begin: 0° - Rot end: 360° - Nrot: 36" 
echo "...................................................................................." 
echo "Proteina-Superficie: Tripsina - Surf Cargada -0.05 C/m^2." 
echo "Separación: 2 Angstrom" 
 
python generador_config_file.py 1a0j_sensor 1a0j geometry/1a0j_d08_split 124 140 2 
 
echo "Se ha Creado Config File Auxiliar" 
echo "Comenzo Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando" 
echo "%%%%%%%% Simulando %%%%%%%%" 
 
python conformation_1hel.py 1a0j_sensor 1a0j_sensor/1a0j 1a0j_sensor/geometry/1a0j_d08_split 124 140 5 2 1a0j-sensor_124-140-2_EF1e-12 
 
echo "Termino Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando" 
