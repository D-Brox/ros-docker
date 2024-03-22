# ROS-Docker Environment
The power of ROS with Docker encapsulation

1. Install Docker

2. Build container
```bash
# First time
docker compose up --build
# After first time
docker compose start
```

3. Enter the dev container
```bash
docker exec -it ros-dev tmux new -As0
```

4. Access dev GUI

```bash
http://localhost:6080
```

5. To stop the container:
```bash
docker compose stop
```

Refs

- [Docker install](https://docs.docker.com/get-docker/)
- [Docker compose install](https://docs.docker.com/compose/install/)
- [Wiki ROS Docker](http://wiki.ros.org/docker/Tutorials)
- [ROS Docker compose](http://wiki.ros.org/docker/Tutorials/Compose)
- [Docker Hub ROS](https://hub.docker.com/_/ros)
