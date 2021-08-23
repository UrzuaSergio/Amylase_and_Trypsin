#!/bin/bash
###############################################################################################################################################################
echo "Simulación que contempla las siguientes Orientaciones:"
echo "Tilt begin: 0° - Tilt_end: 0° - Ntilt: 1 -- Rot begin: 0° - Rot end: 360° - Nrot: 1"
echo "...................................................................................."
echo "Proteina-Superficie: Peptido - Surf Cargada 1e-12 C/m^2."
echo "Separación: 0.2 nm"
python generador_config_file.py pepm1_sensor peptido_model1_ph5.4_parse mesh/peptido_m1_ph5.4_parse_p1.4_d16 0 0 2

echo "Se ha Creado Config File Auxiliar"
echo "Comenzo Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando"
echo "%%%%%%%% Simulando %%%%%%%%"

python conformation_1hel.py pepm1_sensor pepm1_sensor/peptido_model1_ph5.4_parse pepm1_sensor/mesh/peptido_m1_ph5.4_parse_p1.4_d16 0 0 1 2 pepm1d16-sensor_Tilt0-Rot0-2_EF1e-12

echo "Termino Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando"
##############################################################################################################################################################
