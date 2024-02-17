#!/bin/bash

# Launch the Flask app
flask --app products run &

# Store the process ID (PID) of the Flask app
FLASK_PID=$!

# Monitor for changes in "./products.py"
while true; do
    # Check if the file has changed
    if [[ $(find ./products.py -newermt '-1 seconds') ]]; then
        # Kill the previous Flask process
        kill $FLASK_PID

        # Launch the Flask app again
        flask --app products run &

        # Update the stored PID
        FLASK_PID=$!
    fi

    # Wait for 1 second before checking again
    sleep 1
done
