# VLC Server Docker image with docker swarm

## Build and run as

```bash
docker swarm init
docker build -t vlc-server .
docker stack deploy -c vlc-compose.yaml vlc
```
After to watch video use command:
vlc rtsp://127.0.0.1:8554/
