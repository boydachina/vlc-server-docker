# VLC Server Docker image with docker swarm

## Build and run as

```bash
docker swarm init
docker build -t vlc-server .
docker stack deploy -c vlc-compose.yaml vlc
```
After to watch video use command:
```bash
vlc http://127.0.0.1:8080/
```
