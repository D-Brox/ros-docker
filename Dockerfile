FROM ros:noetic AS ros_base
ENV DEBIAN_FRONTEND noninteractive
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> /root/.bashrc


########################
FROM ros_base AS ros_dev
RUN apt-get update && \
    apt-get install -y wget
RUN wget https://deb.volian.org/volian/pool/main/n/nala-legacy/nala-legacy_0.11.0_amd64.deb && \
    apt-get install -y ./nala-legacy_0.11.0_amd64.deb  && \
    rm ./nala-legacy_0.11.0_amd64.deb
RUN nala install -y -f \
    ros-$ROS_DISTRO-desktop-full 
RUN nala update 
RUN nala install -y \
    git \
    x11vnc \
    wget \
    python3 \
    python3-numpy \
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
    tmux
RUN cd /root && git clone https://github.com/gpakosz/.tmux && \
    ln -s -f /root/.tmux/.tmux.conf /root/.tmux.conf && \
    cp /root/.tmux/.tmux.conf.local /root/.tmux.conf.local && \
    sed -i 's/xterm-color)/xterm-color|*-256color)/g' /root/.bashrc
ENV DISPLAY :0
RUN xhost +si:localuser:root
WORKDIR /workspaces
