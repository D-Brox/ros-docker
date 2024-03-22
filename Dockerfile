FROM osrf/ros:noetic-desktop-full AS ros_dev
ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt install -y \
    git \
    x11vnc \
    wget \
    python3 \
    python3-numpy \
    python3-numba \
    unzip \
    xvfb \
    icewm \
    tree \
    dos2unix \
    vim \
    net-tools \
    iputils-ping \
    iproute2 \
    iptables \
    python3-catkin-tools \
    tcpdump \
    nano \
    micro \
    tmux
    
RUN cd /root && git clone https://github.com/gpakosz/.tmux && \
    ln -s -f /root/.tmux/.tmux.conf /root/.tmux.conf && \
    cp /root/.tmux/.tmux.conf.local /root/.tmux.conf.local && \
    sed -i 's/xterm-color)/xterm-color|*-256color)/g' /root/.bashrc
ENV DISPLAY :0
ENV LIBGL_ALWAYS_SOFTWARE 1
WORKDIR /workspaces
RUN git config --global --add safe.directory /workspaces
