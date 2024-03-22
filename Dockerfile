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
RUN cd /root && git clone https://github.com/kanaka/noVNC.git && \
    cd noVNC/utils && git clone https://github.com/kanaka/websockify websockify
ENV DISPLAY :1
ENV SCREEN 0
ENV SCREEN_SIZE 1280x768x24
COPY start_novnc.sh start_novnc.sh
RUN dos2unix start_novnc.sh && chmod 0755 start_novnc.sh
WORKDIR /workspaces
RUN git config --global --add safe.directory /workspaces
