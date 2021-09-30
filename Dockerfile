FROM aica-technology/ros-ws:melodic

RUN apt-get update && apt-get install -y \
  ros-${ROS_DISTRO}-ridgeback-simulator \
  ros-${ROS_DISTRO}-ridgeback-desktop \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
  ros-${ROS_DISTRO}-roslint \
&& rm -rf /var/lib/apt/lists/*

USER ${USER}
WORKDIR ${HOME}/ros_ws
COPY --chown=${USER} ./source ./src

RUN /bin/bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash; catkin_make"