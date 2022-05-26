docker run -it --rm \
	-e DISPLAY=$DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /mnt/aux/steam:/home/steam \
	-v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
	--privileged \
	--network host \
	--ipc=host \
	steam:latest
