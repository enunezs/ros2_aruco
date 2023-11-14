#FROM ros:$ROS_DISTRO-ros-base	
ARG ROS_DISTRO=humble 
FROM ros:$ROS_DISTRO-ros-base	
LABEL maintainer="Emanuel Nunez S gmail dot com"
ENV HOME /root
WORKDIR $HOME
SHELL ["/bin/bash", "-c"]

# general utilities
RUN apt-get update && apt-get install -y \
	wget \
	curl \
	git \
	gdb \
	vim \
	nano \
	python3-pip \
	unzip

# install ros2 packages
RUN apt-get update && apt-get install -y \ 
	ros-$ROS_DISTRO-cv-bridge \
	ros-$ROS_DISTRO-vision-opencv \
	ros-$ROS_DISTRO-compressed-image-transport \
	ros-$ROS_DISTRO-image-transport \
	ros-$ROS_DISTRO-tf-transformations

# install ros2 packages
RUN apt-get update && apt-get install -y \ 
	python3-numpy \
	python3-pip

RUN apt-get update && apt-get install -y \ 
	python3-vcstool \
    	apt-utils \
    	dialog
    	

# ------

RUN apt-get update && apt-get install -y \
	scrot \
	python3-tk\
	python3-dev

# install pip
RUN pip3 install --upgrade pip


RUN pip3 install -U \ 
	transforms3d 

#	opencv-contrib-python \
#	numpy \ 
#	requests \ 
#	boto3 

#### SET ENVIRONMENT
WORKDIR $HOME/ws/ros2_aruco

RUN echo 'alias python="python3"' >> $HOME/.bashrc
RUN echo 'source /opt/ros/$ROS_DISTRO/setup.sh && colcon build' >> $HOME/.bashrc
RUN echo 'source install/setup.bash' >> $HOME/.bashrc
RUN echo 'python3 ros2_aruco/ros2_aruco/aruco_node.py' >> $HOME/.bashrc
# python3 ros2_aruco/ros2_aruco/aruco_node.py
#CMD ["ros2", "launch", "demo_nodes_cpp", "talker_listener.launch.py"]
