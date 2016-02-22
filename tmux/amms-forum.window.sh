# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/Projects/amms/forum"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "FORUM"

# Split window into panes.
#split_v 20
#split_h 50

# Run commands.
#run_cmd "top"     # runs in active pane
#run_cmd "date" 1  # runs in pane 1
run_cmd "git checkout develop"
run_cmd "git pull origin $(current_branch)"
run_cmd "vagrant up"

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into active pane

# Set active pane.
#select_pane 0
