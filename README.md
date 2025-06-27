# Coding-lab_Group 23 - Hospital Data Monitoring & Archival System

This project implements a simple log management system for hospital monitoring device data. It includes functionality for archiving log files and generating basic analytical reports.

## Overview

The system consists of the following components:

1.  **Python Simulators:** (`heart_monitor.py`, `temp_sensor.py`, `water_meter.py`) - These scripts simulate hospital monitoring devices and generate log files in the `hospital_data/active_logs` directory.
2.  **`archive_logs.sh`:** An interactive shell script that allows users to select and archive specific log files from the active logs directory to their respective archive directories (`hospital_data/archived_logs`). Archived files are timestamped.
3.  **`analyze_logs.sh`:** An interactive shell script that allows users to select a log file and generate a basic analysis report. The report includes the count of each device recorded in the log and (optionally) the timestamp of the first and last entry. The report is appended to `hospital_data/reports/analysis_report.txt`.

## Directory Structure

The following directory structure is used by the system:

```
hospital_data/
├── active_logs/
│   ├── heart_rate.log
│   ├── temperature.log
│   └── water_usage.log
├── archived_logs/
│   ├── heart_data_archive/
│   ├── temperature_data_archive/
│   └── water_usage_data_archive/
└── reports/
└── analysis_report.txt
```
## Setup

1.  **Download Python Simulators:** Download the Python scripts (`heart_monitor.py`, `temp_sensor.py`, `water_meter.py`) from the provided URLs and save them.
2.  **Create Directory Structure:** Create the `hospital_data`, `hospital_data/active_logs`, `hospital_data/archived_logs` (and its subdirectories), and `hospital_data/reports` directories.
3.  **Place Python Scripts:** Ensure the Python scripts, when run, output their log files (`heart_rate.log`, `temperature.log`, `water_usage.log`) into the `hospital_data/active_logs` directory. You might need to modify the Python scripts if they don't do this by default.
4.  **Save Shell Scripts:** Save the `archive_logs.sh` and `analyze_logs.sh` files in the main project directory.
5.  **Make Executable:** Give execute permissions to the shell scripts:
    ```bash
    chmod +x archive_logs.sh
    chmod +x analyze_logs.sh
    ```

## Usage

1.  **Run Simulators:** Execute the Python simulator scripts to start generating log data:
    ```bash
    python heart_monitor.py &
    python temp_sensor.py &
    python water_meter.py &
    ```
2.  **Archive Logs:** Run the `archive_logs.sh` script to archive log files:
    ```bash
    ./archive_logs.sh
    ```
    Follow the on-screen menu to select a log file to archive.

3.  **Analyze Logs:** Run the `analyze_logs.sh` script to analyze a log file:
    ```bash
    ./analyze_logs.sh
    ```
    Follow the on-screen menu to select a log file for analysis. The report will be saved in `hospital_data/reports/analysis_report.txt`.

## Contribution
-   **Queen Ruth Uwera** Developed the `heart_rate_monitor.py` script to simulate heart rate monitors and generate corresponding log data.
-   **Megane Keza Mwizerwa** Developed the `temperature_recorder.py` script to simulate temperature sensors and generate temperature log data.
-   **Micheal Okinyi Odhiambo** Developed the `water_consumption.py` script to simulate water usage and generate water consumption log data.
-   **Olowoyo Erioluwa Gideon** Developed the `analyze_logs.sh` script to process log files, extract device statistics, and report the total count per device, as well as the first and last entry timestamps.
-   **Tumba || Zikoranachukwudi Micheal Kongolo** Developed the `archive_logs.sh` script to provide an interactive way to archive selected log files, timestamping them and moving them to the appropriate archive directories
