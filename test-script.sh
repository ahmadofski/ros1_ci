#!/bin/bash
set -e
source /opt/ros/noetic/setup.bash
cd /catkin_ws && source devel/setup.bash && rostest -r tortoisebot_waypoints waypoints_test.test
