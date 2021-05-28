#!/bin/bash 
 
#SBATCH -p gpuk 
#SBATCH --gres=gpu:1 
#SBATCH -J 2tgd-sensor_0-20_pH8_EF1e-12 
#SBATCH -o 2tgd-sensor_0-20_pH8_EF1e-12-%j.out 
#SBATCH -e 2tgd-sensor_0-20_pH8_EF1e-12-%j.err 
#SBATCH --mem=2G 
#SBATCH --time=55:00:00 
#SBATCH --mail-user=sergio.urzua.13@sansano.usm.cl 
#SBATCH --mail-type=BEGIN,END,FAIL 
 
use cuda10 
use anaconda3 
 
export PYTHONPATH=/user/s/surzua/PyCuda/pycuda/lib/python 
cd ../../trypsin_pygbe_pH8/ 
 
echo "Simulación que contempla las siguientes Orientaciones:" 
echo "Tilt begin: 0° - Tilt_end: 20° - Ntilt: 6 -- Rot begin: 0° - Rot end: 360° - Nrot: 36" 
echo "...................................................................................." 
echo "Proteina-Superficie: Tripsina - Surf Cargada -0.05 C/m^2." 
echo "Separación: 2 Angstrom" 
 
python generador_config_file.py 2tgd_sensor 2tgd geometry/2tgd_d08 0 20 2 
 
echo "Se ha Creado Config File Auxiliar" 
echo "Comenzo Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando" 
echo "%%%%%%%% Simulando %%%%%%%%" 
 
python conformation_1hel.py 2tgd_sensor 2tgd_sensor/2tgd 2tgd_sensor/geometry/2tgd_d08 0 20 6 2 2tgd-sensor_0-20-2_EF1e-12 
 
echo "Termino Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando" 
