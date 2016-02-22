# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/Projects/ppw"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "ppw"; then

  # Create a new window inline within session layout definition.
  load_window "ppw-cms"
  load_window "ppw-ssh"

  # Load a defined window layout.
  #load_window "example"

fi
