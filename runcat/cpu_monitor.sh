#!/bin/bash

# CPU monitoring script for runcat
PREV_STATS_FILE="/tmp/cpu_stats_runcat"
CURRENT_STATS_FILE="/tmp/cpu_current_runcat"

# Get current CPU stats
awk '/^cpu / {print $2,$3,$4,$5,$6,$7,$8,$9,$10}' /proc/stat > "$CURRENT_STATS_FILE"

if [ -f "$PREV_STATS_FILE" ]; then
    # Read previous stats
    PREV=$(cat "$PREV_STATS_FILE")
    CURR=$(cat "$CURRENT_STATS_FILE")

    # Extract values
    U_PREV=$(echo "$PREV" | awk '{print $1}')
    N_PREV=$(echo "$PREV" | awk '{print $2}')
    S_PREV=$(echo "$PREV" | awk '{print $3}')
    I_PREV=$(echo "$PREV" | awk '{print $4}')

    U_CURR=$(echo "$CURR" | awk '{print $1}')
    N_CURR=$(echo "$CURR" | awk '{print $2}')
    S_CURR=$(echo "$CURR" | awk '{print $3}')
    I_CURR=$(echo "$CURR" | awk '{print $4}')

    # Calculate totals
    TOTAL_PREV=$((U_PREV + N_PREV + S_PREV + I_PREV))
    TOTAL_CURR=$((U_CURR + N_CURR + S_CURR + I_CURR))

    # Calculate deltas
    IDLE_DELTA=$((I_CURR - I_PREV))
    TOTAL_DELTA=$((TOTAL_CURR - TOTAL_PREV))

    if [ $TOTAL_DELTA -gt 0 ]; then
        # Calculate busy percentage
        BUSY_PERCENTAGE=$((100 * TOTAL_DELTA / TOTAL_DELTA))
        # Calculate actual busy time (non-idle time)
        BUSY_TIME=$((TOTAL_DELTA - IDLE_DELTA))
        BUSY_PERCENTAGE=$((100 * BUSY_TIME / TOTAL_DELTA))
        printf "%.2f" "$BUSY_PERCENTAGE"
    else
        echo "0"
    fi
else
    echo "0"
fi

# Save current stats for next run
cp "$CURRENT_STATS_FILE" "$PREV_STATS_FILE"