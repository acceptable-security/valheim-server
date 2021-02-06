#!/bin/bash

export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

exit_script() {
	echo 1 > server_exit.drp
	echo "Server ending"
}

trap exit_script SIGTERM

./valheim_server.x86_64 \
	-name $(cat /valheim/name) \
	-port $(cat /valheim/port) \
	-world $(cat /valheim/world) \
	-password $(cat /valheim/password) \
	-public 1 > /dev/null