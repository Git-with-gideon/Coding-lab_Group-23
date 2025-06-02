#!/bin/bash

# Define log directory and report file
ACTIVE_LOGS_DIR="hospital_data/active_logs"
REPORTS_DIR="hospital_data/reports"
REPORT_FILE="$REPORTS_DIR/analysis_report.txt"

# Log file options
declare -A LOG_OPTIONS=(
  [1]="heart_rate.log"
  [2]="temperature.log"
  [3]="water_usage.log"
)

# Function to display the menu
show_menu() {
  echo "Select log file to analyze:"
  echo "1) Heart Rate (heart_rate.log)"
  echo "2) Temperature (temperature.log)"
  echo "3) Water Usage (water_usage.log)"
  echo "Enter choice (1-3): "
}

# Function to analyze the selected log
analyze_log() {
  local choice=$1
  local log_file="${LOG_OPTIONS[$choice]}"
  local log_path="$ACTIVE_LOGS_DIR/$log_file"

  # Check if log file exists
  if [ ! -f "$log_path" ]; then
    echo "Error: $log_file not found in $ACTIVE_LOGS_DIR"
    return 1
  fi

  echo "Analyzing $log_file..."

  # Count occurrences of each device
  echo "Device Counts:" >> "$REPORT_FILE"
  grep -o "DEVICE=[^ ]*" "$log_path" | sort | uniq -c | awk '{printf "%s: %s\n", $2, $1}' >> "$REPORT_FILE"

  # Find first and last entry timestamps (Bonus)
  echo -e "\nFirst and Last Entry Timestamps (Bonus):" >> "$REPORT_FILE"
  first_timestamp=$(head -n 1 "$log_path" | awk '{print $1, $2}')
  last_timestamp=$(tail -n 1 "$log_path" | awk '{print $1, $2}')
  echo "First: $first_timestamp" >> "$REPORT_FILE"
  echo "Last:  $last_timestamp" >> "$REPORT_FILE"

  echo "Analysis of $log_file complete. Results appended to $REPORT_FILE"
}

# Main script logic
show_menu

read -r choice

# Validate user input
if ! [[ "$choice" =~ ^[1-3]$ ]]; then
  echo "Invalid choice. Please enter a number between 1 and 3."
  exit 1
fi

analyze_log "$choice"
