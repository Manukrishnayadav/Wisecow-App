#!/bin/bash
# Analyze logs for errors or warnings

LOG_FILE="/var/log/syslog"  # Change this to your app log if needed

if [ ! -f "$LOG_FILE" ]; then
    echo "Log file $LOG_FILE does not exist."
    exit 1
fi

echo "Analyzing log file: $LOG_FILE"
echo "---------------------------------"

ERROR_COUNT=$(grep -i "error" "$LOG_FILE" | wc -l)
WARN_COUNT=$(grep -i "warn" "$LOG_FILE" | wc -l)

echo "Total ERRORs found: $ERROR_COUNT"
echo "Total WARNINGS found: $WARN_COUNT"
echo
echo "Last 10 errors:"
grep -i "error" "$LOG_FILE" | tail -n 10
