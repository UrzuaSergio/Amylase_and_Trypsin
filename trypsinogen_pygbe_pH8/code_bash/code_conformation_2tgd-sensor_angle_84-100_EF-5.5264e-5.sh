#!/bin/bash 
 
#SBATCH -p gpuk 
#SBATCH --gres=gpu:1 
#SBATCH -J 2tgd-sensor_84-100_pH8_EF-5.5264e-5 
#SBATCH -o 2tgd-sensor_84-100_pH8_EF-5.5264e-5-%j.out 
#SBATCH -e 2tgd-sensor_84-100_pH8_EF-5.5264e-5-%j.err 
#SBATCH --mem=2G 
#SBATCH --time=55:00:00 
#SBATCH --mail-user=sergio.urzua.13@sansano.usm.cl 
#SBATCH --mail-type=BEGIN,END,FAIL 
 
use cuda10 
use anaconda3 
 
export PYTHONPATH=/user/s/surzua/PyCuda/pycuda/lib/python 
cd ../../trypsin_pygbe_pH8/ 
 
echo "Simulación que contempla las siguientes Orientaciones:" 
echo "Tilt begin: 84° - Tilt_end: 100° - Ntilt: 5 -- Rot begin: 0° - Rot end: 360° - Nrot: 36" 
echo "...................................................................................." 
echo "Proteina-Superficie: Tripsina - Surf Cargada -0.05 C/m^2." 
echo "Separación: 2 Angstrom" 
 
python generador_config_file.py 2tgd_sensor 2tgd geometry/2tgd_d08 84 100 2 
 
echo "Se ha Creado Config File Auxiliar" 
echo "Comenzo Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando" 
echo "%%%%%%%% Simulando %%%%%%%%" 
 
python conformation_1hel.py 2tgd_sensor 2tgd_sensor/2tgd 2tgd_sensor/geometry/2tgd_d08 84 100 5 2 2tgd-sensor_84-100-2_EF-5.5264e-5 
 
echo "Termino Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando" 
