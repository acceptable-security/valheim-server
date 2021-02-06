# valheim-server

A docker image for running a Valheim server. Usage:

```sh
docker build . -t valheim
docker run -d valheim \
	--env VALHEIM_NAME="ValheimName" \
	--env VALHEIM_WORLD="ValheimWorld" \
	--env VALHEIM_PASWORD="ValheimPassword" \
	--env VALHEIM_PORT=2456 \
	-p 2456-2458:2456-2458/tcp -p 2456-2458:2456-2458/udp
```