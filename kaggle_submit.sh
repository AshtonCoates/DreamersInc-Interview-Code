#!/bin/bash

# Define log file path
LOG_FILE="submission_log.txt"

# Get current timestamp
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Submit to Kaggle and capture the output
OUTPUT=$(kaggle competitions submit -c "directional-forecasting-in-cryptocurrencies" -f "data/submission.csv" -m "Automated submission" 2>&1)

# Check if submission was successful
if [ $? -eq 0 ]; then
    echo "$TIMESTAMP - Submission completed successfully!" >> "$LOG_FILE"
    echo "$OUTPUT" >> "$LOG_FILE"
else
    echo "$TIMESTAMP - Submission failed." >> "$LOG_FILE"
    echo "$OUTPUT" >> "$LOG_FILE"
fi

# Optional: Print the latest log entry to the terminal
tail -n 2 "$LOG_FILE"