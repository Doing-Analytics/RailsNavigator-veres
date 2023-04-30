#!/bin/bash

# Set the desired Node version
NODE_VERSION="v18.16.0"

# Function to check if the desired Node version is installed
is_node_version_installed() {
  nvm ls "$NODE_VERSION" > /dev/null 2>&1
}

# Function to install the desired Node version
install_node_version() {
  nvm install "$NODE_VERSION"
}

# Function to kill process running on the specified port
kill_process_on_port() {
  local port="$1"
  lsof -i tcp:"$port" | awk 'NR>1 {print $2}' | xargs -I {} kill -9 {} 2>/dev/null
}

# Function to run Rails tasks
run_rails_task() {
  local task="$1"
  bundle exec rake "$task"
}

# Function to start the Rails server
start_rails_server() {
  bin/dev
}

# Function to start a Rails console in sandbox mode
start_sandbox_console() {
  bundle exec rails console --sandbox
}

# Function to run bundle install
run_bundle_install() {
  bundle install
}

# Kill the process running on port 3000
kill_process_on_port 3000

# Check if the desired Node version is installed, install it if not
if ! is_node_version_installed; then
  install_node_version
fi

# Switch to the desired Node version
nvm use "$NODE_VERSION"

# Run Rails tasks
run_rails_task assets:clobber
run_rails_task assets:precompile

# Initialize options
bundle_option=false
action=""

# Process command-line arguments
while getopts ":bcs" opt; do
  case "$opt" in
    b)
      bundle_option=true
      ;;
    c)
      action="console"
      ;;
    s)
      action="server"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Execute bundle install if the -b option is set
if [ "$bundle_option" = true ]; then
  run_bundle_install
fi

# Run the chosen action (console or server)
case "$action" in
  console)
    start_sandbox_console
    ;;
  server)
    start_rails_server
    ;;
  *)
    echo "Usage: $0 [-b] [-c | -s]"
    echo "  -b  Run bundle install before starting the console or server"
    echo "  -c  Run Rails console in sandbox mode"
    echo "  -s  Start Rails server"
    exit 1
    ;;
esac