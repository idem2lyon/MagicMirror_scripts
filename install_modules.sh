
echo "Installing module MMM-pages"
cd ~/MagicMirror/modules
git clone https://github.com/edward-shen/MMM-pages.git

#######################
#######################

echo "Installing module MMM-GroveGestures"
sudo apt-get update
sudo apt-get install i2c-tools
# sudo i2cdetect -y 1
#
cd ~/MagicMirror/modules
git clone https://github.com/eouia/MMM-GroveGestures
cd MMM-GroveGestures
npm install
cd scripts && chmod +x *.sh

cd ~/MagicMirror/modules/MMM-GroveGestures/py
cp grove_gesture_sensor.py.RPI grove_gesture_sensor.py

# Wanna test it ? 
#cd ~/MagicMirror/modules/MMM-GroveGestures/py
#python gesture_print.py


#######################
#######################

echo "Installing module MMM-SNCF"
cd ~/MagicMirror/modules
git clone https://github.com/jvanoost/MMM-SNCF.git
cd MMM-SNCF
npm install

#######################
#######################

echo "Installing module MMM-Jeedom"
cd ~/MagicMirror/modules
git clone https://github.com/prysme01/MMM-Jeedom.git
#cd MMM-Jeedom
#npm install

#######################
#######################

echo "Installing module MMM-VigilanceMeteoFrance"
cd ~/MagicMirror/modules
git clone https://github.com/grenagit/MMM-VigilanceMeteoFrance
cd ~/MagicMirror/modules/MMM-VigilanceMeteoFrance
npm install

#######################
#######################

echo "Installing module MMM-DarkSkyForecast"
cd ~/MagicMirror/modules
git clone https://github.com/jclarke0000/MMM-DarkSkyForecast.git
cd MMM-DarkSkyForecast 
npm install

#######################
#######################

echo "Installing module MMM-CalendarExt2"
cd ~/MagicMirror/modules
git clone --depth=1 https://github.com/eouia/MMM-CalendarExt2
cd MMM-CalendarExt2
npm install

#######################
#######################

echo "Installing module MMM-Tools"
cd ~/MagicMirror/modules
git clone https://github.com/bugsounet/MMM-Tools
npm install

#######################
#######################

echo "Installing module MMM-GoogleFit"
cd ~/MagicMirror/modules
git clone https://github.com/amcolash/MMM-GoogleFit.git
# Register device at https://google.com/device

#######################
#######################

echo "Installing module MMM-TelegramBot"
cd ~/MagicMirror/modules
git clone https://github.com/bugsounet/MMM-TelegramBot.git
cd MMM-TelegramBot
npm install

#######################
#######################

echo "Installing module MMM-page-indicator"
cd ~/MagicMirror/modules
git clone https://github.com/edward-shen/MMM-page-indicator.git

#######################
#######################

#sudo chgrp gpio /sys/class/gpio/export
#sudo chgrp gpio /sys/class/gpio/unexport
#sudo chmod 775 /sys/class/gpio/export
#sudo chmod 775 /sys/class/gpio/unexport

#######################
#######################

exit 0



