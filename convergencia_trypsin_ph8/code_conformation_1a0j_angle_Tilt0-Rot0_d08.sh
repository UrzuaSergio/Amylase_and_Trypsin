#!/bin/bash
###############################################################################################################################################################
echo "Simulación que contempla las siguientes Orientaciones:"
echo "Tilt begin: 0° - Tilt_end: 0° - Ntilt: 1 -- Rot begin: 0° - Rot end: 360° - Nrot: 1"
echo "...................................................................................."
echo "Proteina: Peptido."
echo "Separación: 0.2 nm"
python generador_config_file.py 1a0j_isolated 1a0j geometry/1a0j_d08 0 0 2

echo "Se ha Creado Config File Auxiliar"
echo "Comenzo Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando"
echo "%%%%%%%% Simulando %%%%%%%%"

python conformation_1hel.py 1a0j_isolated 1a0j_isolated/1a0j 1a0j_isolated/geometry/1a0j_d08 0 0 1 2 1a0j_d08-isolated_Tilt0-Rot0-2_EF1e-12

echo "Termino Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando"
##############################################################################################################################################################
