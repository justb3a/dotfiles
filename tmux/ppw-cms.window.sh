# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/ppw-cms"

# Create new window. If no argument is given, window name will be based on
# layout file name.
window_root "~/Projects/ppw"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "CMS"

# Split window into panes.
split_v 50
#split_h 50

# Run commands.
run_cmd "git checkout develop" 1
run_cmd "cd html/typo3conf/ext/" 2

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into active pane

# Set active pane.
select_pane 1
