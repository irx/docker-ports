docker run -it --rm \
	-e DISPLAY=$DISPLAY \
	--ulimit nofile=524288:524288 \
	--ulimit core=-1 \
	--ulimit data=-1 \
	--ulimit fsize=-1 \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /mnt/aux/steam:/home/steam \
	-v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
	--privileged \
	--network host \
	--ipc=host \
	steam:latest steam -no-cef-sandbox
