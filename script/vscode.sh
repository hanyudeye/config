#!/bin/bash
#
# This script opens a gnome-terminal in the directory you select.
#
# Distributed under the terms of GNU GPL version 2 or later
#
# Install in ~/.gnome2/nautilus-scripts or ~/Nautilus/scripts
# You need to be running Nautilus 1.0.3+ to use scripts.
# When a directory is selected, go there. Otherwise go to current
# directory. If more than one directory is selected, show error.
## 右键打开软件

if [ -n "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS" ]; then
set $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS
if [ $# -eq 1 ]; then
destination="$1"
# Go to file's directory if it's a file
if [ ! -d "$destination" ]; then
destination="`dirname "$destination"`"
fi
else
zenity --error --title="Error - Open terminal here" /
--text="You can only select one directory."
exit 1
fi
else
destination="`echo "$NAUTILUS_SCRIPT_CURRENT_URI" | sed 's/^file://////'`"
fi
# It's only possible to go to local directories
if [ -n "`echo "$destination" | grep '^[a-zA-Z0-9]/+:'`" ]; then
zenity --error --title="Error - Open terminal here" /
--text="Only local directories can be used."
exit 1
fi
cd "$destination"
# exec visual-studio-code "$destination"
exec code "$destination"
