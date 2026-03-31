#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Course: Open Source Software (Auditing Python)
# Description: Uses a while loop to parse /var/log/dpkg.log
#              for the keyword 'install' and prints last 5.
# ============================================================

echo "============================================"
echo "           LOG FILE ANALYZER               "
echo "============================================"
echo ""

LOG_FILE="/var/log/dpkg.log"
KEYWORD="install"
MAX_RESULTS=5

echo "  Log File  : $LOG_FILE"
echo "  Keyword   : '$KEYWORD'"
echo "  Showing   : Last $MAX_RESULTS matches"
echo ""

# --- Check file exists and is readable ---
if [ ! -f "$LOG_FILE" ]; then
    echo "  ERROR: '$LOG_FILE' not found."
    echo ""
    echo "  This can happen in minimal or fresh WSL environments."
    echo "  TIP: Run 'sudo apt install nano' to generate some log entries,"
    echo "       then re-run this script."
    exit 1
fi

if [ ! -r "$LOG_FILE" ]; then
    echo "  ERROR: Cannot read '$LOG_FILE'."
    echo "  Try running with: sudo bash 04_log_analyzer.sh"
    exit 1
fi

echo "[ SCANNING LOG FILE... ]"
echo ""

# --- Collect all matching lines into an array using a while loop ---
declare -a matches
line_count=0
match_count=0

while IFS= read -r line; do
    (( line_count++ ))
    # Search for 'install' keyword (case-insensitive)
    if echo "$line" | grep -qi "$KEYWORD"; then
        matches+=("$line")
        (( match_count++ ))
    fi
done < "$LOG_FILE"

echo "  Lines scanned        : $line_count"
echo "  Total matches found  : $match_count"
echo ""

# --- Print the last MAX_RESULTS matches ---
if [ "$match_count" -eq 0 ]; then
    echo "  No lines containing '$KEYWORD' were found."
else
    echo "[ LAST $MAX_RESULTS MATCHING ENTRIES ]"
    echo "  --------------------------------------------"

    total=${#matches[@]}
    start=$(( total - MAX_RESULTS ))
    [ "$start" -lt 0 ] && start=0

    idx=1
    for (( i=start; i<total; i++ )); do
        echo "  [$idx] ${matches[$i]}"
        (( idx++ ))
    done
fi

echo ""

# --- Bonus: Quick log activity summary ---
echo "[ LOG ACTIVITY SUMMARY ]"
install_total=$(grep -c " install " "$LOG_FILE" 2>/dev/null || echo 0)
remove_total=$(grep -c " remove "  "$LOG_FILE" 2>/dev/null || echo 0)
upgrade_total=$(grep -c " upgrade " "$LOG_FILE" 2>/dev/null || echo 0)

echo "  'install' entries  : $install_total"
echo "  'remove'  entries  : $remove_total"
echo "  'upgrade' entries  : $upgrade_total"

echo ""
echo "============================================"
echo "         END OF LOG FILE ANALYZER          "
echo "============================================"
