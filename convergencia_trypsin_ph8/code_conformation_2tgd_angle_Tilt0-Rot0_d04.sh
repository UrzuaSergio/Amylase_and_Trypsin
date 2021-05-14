#!/bin/bash
###############################################################################################################################################################
echo "Simulación que contempla las siguientes Orientaciones:"
echo "Tilt begin: 0° - Tilt_end: 0° - Ntilt: 1 -- Rot begin: 0° - Rot end: 360° - Nrot: 1"
echo "...................................................................................."
echo "Proteina: Peptido."
echo "Separación: 0.2 nm"
python generador_config_file.py 2tgd_isolated 2tgd geometry/2tgd_d04 0 0 2

echo "Se ha Creado Config File Auxiliar"
echo "Comenzo Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando"
echo "%%%%%%%% Simulando %%%%%%%%"

python conformation_1hel.py 2tgd_isolated 2tgd_isolated/2tgd 2tgd_isolated/geometry/2tgd_d04 0 0 1 2 2tgd_d04-isolated_Tilt0-Rot0-2_EF1e-12

echo "Termino Ejecucion de PyGBe para Caso Proteina-Superficie Interactuando"
##############################################################################################################################################################
