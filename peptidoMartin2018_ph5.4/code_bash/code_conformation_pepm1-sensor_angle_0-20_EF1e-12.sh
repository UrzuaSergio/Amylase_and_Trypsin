#!/bin/bash 
 
#SBATCH -p gpuk 
#SBATCH --gres=gpu:1 
#SBATCH -J pepm1-sensor_0-20_pH5.4_EF1e-12 
#SBATCH -o pepm1-sensor_0-20_pH5.4_EF1e-12-%j.out 
#SBATCH -e pepm1-sensor_0-20_pH5.4_EF1e-12-%j.err 
#SBATCH --mem=2G 
#SBATCH --time=55:00:00 
#SBATCH --mail-user=sergio.urzua.13@sansano.usm.cl 
#SBATCH --mail-type=BEGIN,END,FAIL 
 
use cuda10 
use anaconda3 
 
export PYTHONPATH=/user/s/surzua/PyCuda/pycuda/lib/python 
cd ../../peptidoMartin2018_ph5.4/ 
 
echo "Simulación que contempla las siguientes Orientaciones:" 
echo "Tilt begin: 0° - Tilt_end: 20° - Ntilt: 6 -- Rot begin: 0° - Rot end: 360° - Nrot: 36" 
echo "...................................................................................." 
echo "Proteina-Superficie: Beta-Tripsina porcino - Surf Cargada -0.04 C/m^2." 
echo "Separación: 2 Angstrom" 
 
python generador_config_file.py pepm1_sensor peptido_model1_ph5.4_parse mesh/peptido_m1_ph5.4_parse_p1.4_d04 0 20 2 
 
echo "Se ha Creado Config File Auxiliar" 
echo "Comenzo Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando" 
echo "%%%%%%%% Simulando %%%%%%%%" 
 
python conformation_1hel.py pepm1_sensor pepm1_sensor/peptido_model1_ph5.4_parse pepm1_sensor/mesh/peptido_m1_ph5.4_parse_p1.4_d04 0 20 6 2 pepm1-sensor_0-20-2_EF1e-12 
 
echo "Termino Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando" 
