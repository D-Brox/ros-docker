# ROS-Docker Environment
The power of ROS with Docker encapsulation

1. Install Docker: 

2. Run docker compose

```bash
# First time
docker compose up --build
# After first time
docker compose start
```

3. Enable docker xhost access
```bash
xhost +"local:docker@"
```

4. Enter the dev container
```bash
docker exec -it ros-dev tmux new -As0
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
