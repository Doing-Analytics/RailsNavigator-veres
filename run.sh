#!/bin/bash

# Kill the process running on port 3000
lsof -i tcp:3000 | awk '{print $2}' | xargs kill -9

# Start the Rails server
bin/dev