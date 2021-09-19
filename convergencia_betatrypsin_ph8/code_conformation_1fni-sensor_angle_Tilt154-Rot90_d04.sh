#!/bin/bash
###############################################################################################################################################################
echo "Simulación que contempla las siguientes Orientaciones:"
echo "Tilt begin: 154° - Tilt_end: 154° - Ntilt: 1 -- Rot begin: 90° - Rot end: 90° - Nrot: 1"
echo "...................................................................................."
echo "Proteina-Superficie: Tripsina - Surf Cargada"
echo "Separación: 0.2 nm"
python generador_config_file.py 1fni_sensor 1fni geometry/1fni_d04_split 154 154 2

echo "Se ha Creado Config File Auxiliar"
echo "Comenzo Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando"
echo "%%%%%%%% Simulando %%%%%%%%"

python conformation_1hel.py 1fni_sensor 1fni_sensor/1fni 1fni_sensor/geometry/1fni_d04_split 154 154 1 2 1fni_d04-sensor_Tilt154-Rot90-2_EF1e-12

echo "Termino Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando"
##############################################################################################################################################################
