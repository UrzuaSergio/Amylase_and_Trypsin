#!/bin/bash 
 
#SBATCH -p gpuk 
#SBATCH --gres=gpu:1 
#SBATCH -J pepm1-sensor_84-100_pH5.4_EF5.5264e-5 
#SBATCH -o pepm1-sensor_84-100_pH5.4_EF5.5264e-5-%j.out 
#SBATCH -e pepm1-sensor_84-100_pH5.4_EF5.5264e-5-%j.err 
#SBATCH --mem=2G 
#SBATCH --time=55:00:00 
#SBATCH --mail-user=sergio.urzua.13@sansano.usm.cl 
#SBATCH --mail-type=BEGIN,END,FAIL 
 
use cuda10 
use anaconda3 
 
export PYTHONPATH=/user/s/surzua/PyCuda/pycuda/lib/python 
cd ../../peptidoMartin2018_ph5.4/ 
 
echo "Simulación que contempla las siguientes Orientaciones:" 
echo "Tilt begin: 84° - Tilt_end: 100° - Ntilt: 5 -- Rot begin: 0° - Rot end: 360° - Nrot: 36" 
echo "...................................................................................." 
echo "Proteina-Superficie: Beta-Tripsina porcino - Surf Cargada -0.04 C/m^2." 
echo "Separación: 2 Angstrom" 
 
python generador_config_file.py pepm1_sensor peptido_model1_ph5.4_parse mesh/peptido_m1_ph5.4_parse_p1.4_d04 84 100 2 
 
echo "Se ha Creado Config File Auxiliar" 
echo "Comenzo Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando" 
echo "%%%%%%%% Simulando %%%%%%%%" 
 
python conformation_1hel.py pepm1_sensor pepm1_sensor/peptido_model1_ph5.4_parse pepm1_sensor/mesh/peptido_m1_ph5.4_parse_p1.4_d04 84 100 5 2 pepm1-sensor_84-100-2_EF5.5264e-5 
 
echo "Termino Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando" 
