#!/bin/bash -e

SCRIPT_DIR=$(dirname "$0")
WORKSPACE_DIR="/home/user/workspace"
SRC_DIR="$WORKSPACE_DIR/src"
GO2_DESCRIPTION_URL="https://github.com/inria-paris-robotics-lab/go2_description.git"

# Check if the Go2 Description repository already exists
if [ ! -d "$SRC_DIR/go2_description" ]; then
    echo "[GO2 DESCRIPTION]Cloning Go2 Description repository..."
    git clone "$GO2_DESCRIPTION_URL" "$SRC_DIR/go2_description"
fi

source /opt/ros/$ROS_DISTRO/setup.bash

# Build the workspace
echo "[GO2 DESCRIPTION]Building the workspace..."
cd "$WORKSPACE_DIR"
colcon build --symlink-install

source "$WORKSPACE_DIR/install/setup.bash"