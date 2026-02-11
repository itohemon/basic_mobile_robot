FROM osrf/ros:foxy-desktop

SHELL ["/bin/bash", "-c"]

# Upgrade OS
RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

RUN cd /root/ && \
    git clone https://github.com/osrf/gazebo_models.git

ENV ROS_DISTRO foxy

# Add Package
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        ros-${ROS_DISTRO}-joint-state-publisher-gui \
        ros-${ROS_DISTRO}-xacro \
        ros-${ROS_DISTRO}-gazebo-ros-pkgs \
        ros-${ROS_DISTRO}-rqt-robot-steering \
        ros-${ROS_DISTRO}-robot-localization \
        ros-${ROS_DISTRO}-nav2-bringup \
        ros-${ROS_DISTRO}-navigation2 \
        ros-${ROS_DISTRO}-slam-toolbox \
        python3-pip \
        gfortran \
        rtklib \
        build-essential && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

RUN echo 'export GAZEBO_MODEL_PATH=/usr/share/gazebo-11/models:/root/gazebo_models:/ros2_ws/src/basic_mobile_robot/models/'  >> /root/.bashrc && \
    echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> /root/.bashrc && \
    echo "source /ros2_ws/install/setup.bash" >> /root/.bashrc

COPY ./ros_entrypoint.sh /
RUN chmod +x /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]

