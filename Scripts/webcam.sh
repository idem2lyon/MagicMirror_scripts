#!/bin/bash

sudo apt-get install libjpeg8-dev imagemagick subversion cmake
cd
mkdir mjpg-streamer
cd mjpg-streamer
git clone https://github.com/jacksonliam/mjpg-streamer.git
cd mjpg-streamer/mjpg-streamer-experimental/
CFLAGS+="-Ofast -mfpu=vfp -mfloat-abi=hard -march=armv6zk -mtune=arm1176jzf-s" make
sudo make install


cat <<EOF >>webcam.sh
#!/bin/sh
# Created on $(date # : <<-- this will be evaluated before cat;)

# adjust these

INPUT_PLUGIN="/usr/local/lib/mjpg-streamer/input_uvc.so";
DEVICE="/dev/video0";
FRAMES="25";
RESOLUTION="1024x756";

OUTPUT_PLUGIN="/usr/local/lib/mjpg-streamer/output_http.so";
PORT="8090";
CREDENTIALS="-c login:password"
#OPTIONS="-rot 180"
OPTIONS=

# the following are defaults and should not need to be changed
EXEC="/usr/local/bin/mjpg_streamer"
WEB_DIR="/usr/local/share/mjpg-streamer/www";


# mjgp_streamer often does not start on first try. Why ?
start_streamer(){
    for i in {1..5}    # try up to 5 times
    do
        ${EXEC} -b -i "${INPUT_PLUGIN} -n -d ${DEVICE} -f ${FRAMES} -r ${RESOLUTION} ${OPTIONS}" -o "${OUTPUT_PLUGIN} -p ${PORT} -w ${WEB_DIR} ${CREDENTIALS}"  > /dev/null 2>&1
        sleep $((1+i)) # waiting progressively longer
        if pgrep mjpg_streamer > /dev/null
        then
          echo "mjpg_streamer started"
          return
        fi
    done
    echo "could not start mjpg_streamer"
}


# Carry out specific functions when asked to by the system
case "$1" in
        start)
                if pgrep mjpg_streamer > /dev/null
                then
                    echo "mjpg_streamer already running"
                else
                    start_streamer
                fi
                ;;
        stop)
                if pgrep mjpg_streamer > /dev/null
                then
                    killall mjpg_streamer
                    echo "mjpg_streamer stopped"
                else
                    echo "mjpg_streamer is not running"
                fi
                ;;
        restart)
                if pgrep mjpg_streamer > /dev/null
                then
                    killall mjpg_streamer
                    echo "mjpg_streamer stopped"
                else
                    echo "mjpg_streamer is not running"
                fi
                start_streamer
                ;;
        status)
                pid=`ps -A | grep mjpg_streamer | grep -v "grep" | grep -v mjpg_streamer. | awk '{print $1}' | head -n 1`
                if [ -n "$pid" ];
                then
                        echo "mjpg_streamer is running with pid ${pid}"
                        echo "mjpg_streamer was started with the following command line"
                        cat /proc/${pid}/cmdline ; echo ""
                else
                        echo "mjpg_streamer is not running"
                fi
                ;;
        *)
                echo "Usage: $0 {start|stop|restart|status}"
                exit 1
                ;;
esac
exit 0

EOF
