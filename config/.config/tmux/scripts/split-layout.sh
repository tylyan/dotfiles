#!/bin/bash

# Tmux automatic pane layout script
# Creates a layout with one full-height pane on the left
# and three stacked panes on the right (10%, 70%, 20%)
#
# Usage: ./split-layout.sh [directory_path]

# Check if a directory path was provided
if [ -n "$1" ]; then
  TARGET_DIR="$1"

  # Verify the directory exists
  if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' does not exist"
    exit 1
  fi

  # Change to the target directory in the current pane
  tmux send-keys "cd '$TARGET_DIR'" C-m
fi

# Step 1: Vertically split the pane (creates left and right)
tmux split-window -h -c "#{pane_current_path}"

# Step 2: Horizontally split the right pane twice (creates 3 panes on right)
tmux split-window -v -c "#{pane_current_path}"
tmux split-window -v -c "#{pane_current_path}"

# Step 3: Resize the right panes to achieve 10%, 70%, 20% distribution
# Select the top-right pane and resize to 10%
tmux select-pane -t 2
tmux resize-pane -y 10%

# Select the middle-right pane and resize to 70%
tmux select-pane -t 3
tmux resize-pane -y 70%

# The bottom pane will automatically take the remaining 20%

# Select the left pane to return focus
tmux select-pane -t 0

exit 0
