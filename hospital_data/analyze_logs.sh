#!/bin/bash

# Set the folder containing the log files
taget_dir="active_logs"

# Move to the folder if not already there
if [ "$PWD" != "$(realpath "$taget_dir")" ]; then
    cd "$taget_dir" 
else 
	echo "Directory '$taget_dir' not found."; exit 1; 
fi

# Main loop
while true; do
    echo "
Select a log file to analyze:
1) Heart Rate
2) Temperature
3) Water Usage
4) Exit"
    read -r choice

    if [ "$choice" = "4" ]; then
        echo "Exiting log viewer. Goodbye!"
        break
    elif [ "$choice" = "1" ]; then
        log_file="heart_rate.log"
    elif [ "$choice" = "2" ]; then
        log_file="temperature.log"
    elif [ "$choice" = "3" ]; then
        log_file="water_usage.log"
    else
        echo "Invalid choice. Try again."
        continue
    fi

    # Check if the file exists
    if [ ! -f "$log_file" ]; then
        echo "File '$log_file' not found."
        continue
    fi

    echo "
View options for '$log_file':
1) Oldest (first 10 lines)
2) Newest (last 10 lines)
3) All"
    read -r user_choice

    if [ "$user_choice" = "1" ]; then
        echo "--- Oldest ---"
        head -n 10 "$log_file"
    elif [ "$user_choice" = "2" ]; then
        echo "--- Newest ---"
        tail -n 10 "$log_file"
    elif [ "$user_choice" = "3" ]; then
        echo "--- Full Log ---"
        cat "$log_file"
    else
        echo "Invalid view option."
    fi

    echo ""
    echo "Done. Returning to main menu..."
done

