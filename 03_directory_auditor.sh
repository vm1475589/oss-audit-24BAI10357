#!/bin/bash
# ============================================================
# Script 3: Directory Auditor
# Course: Open Source Software (Auditing Python)
# Description: Uses a for loop to check disk sizes and
#              read/write permissions of key system dirs.
# ============================================================

echo "============================================"
echo "           DIRECTORY AUDITOR               "
echo "============================================"
echo ""

# Directories to audit
DIRECTORIES=("/etc" "/var/log" "/usr/bin" "/etc/python3")

# --- Summary Table Header ---
echo "[ SUMMARY TABLE ]"
echo ""
printf "  %-20s %-10s %-10s %-10s %-20s\n" "DIRECTORY" "SIZE" "READABLE" "WRITABLE" "PERMISSIONS"
printf "  %-20s %-10s %-10s %-10s %-20s\n" "---------" "----" "--------" "--------" "-----------"

for dir in "${DIRECTORIES[@]}"; do
    if [ -d "$dir" ]; then
        size=$(du -sh "$dir" 2>/dev/null | cut -f1)
        readable=$([ -r "$dir" ] && echo "YES ✔" || echo "NO  ✘")
        writable=$([ -w "$dir" ] && echo "YES ✔" || echo "NO  ✘")
        perms=$(stat -c "%A (%a)" "$dir")
        printf "  %-20s %-10s %-10s %-10s %-20s\n" "$dir" "$size" "$readable" "$writable" "$perms"
    else
        printf "  %-20s %-10s %-10s %-10s %-20s\n" "$dir" "N/A" "N/A" "N/A" "NOT FOUND"
    fi
done

echo ""
echo "[ DETAILED BREAKDOWN ]"
echo ""

# --- Detailed check using for loop ---
for dir in "${DIRECTORIES[@]}"; do
    echo "  --------------------------------------------"
    echo "  Directory  : $dir"

    if [ -d "$dir" ]; then
        echo "  Exists     : Yes"
        echo "  Size       : $(du -sh "$dir" 2>/dev/null | cut -f1)"
        echo "  Readable   : $([ -r "$dir" ] && echo 'Yes' || echo 'No — permission denied')"
        echo "  Writable   : $([ -w "$dir" ] && echo 'Yes' || echo 'No — read-only or restricted')"
        echo "  Executable : $([ -x "$dir" ] && echo 'Yes (directory is traversable)' || echo 'No')"
        echo "  Owner      : $(stat -c '%U' "$dir")"
        echo "  Group      : $(stat -c '%G' "$dir")"
        echo "  Symbolic   : $(stat -c '%A' "$dir")"
        echo "  Octal      : $(stat -c '%a' "$dir")"
        echo "  Last Mod   : $(stat -c '%y' "$dir" | cut -d'.' -f1)"
    else
        echo "  Exists     : No"
        echo "  Note       : This directory does not exist on this system."
        echo "               (/etc/python3 may be absent on some Ubuntu versions)"
    fi
    echo ""
done

echo "============================================"
echo "         END OF DIRECTORY AUDITOR          "
echo "============================================"
