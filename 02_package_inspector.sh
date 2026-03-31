#!/bin/bash
# ============================================================
# Script 2: Package Inspector
# Course: Open Source Software (Auditing Python)
# Description: Uses dpkg to check if Python3 is installed
#              and prints its version details.
# ============================================================

echo "============================================"
echo "           PACKAGE INSPECTOR               "
echo "============================================"
echo ""

PACKAGE="python3"

echo "[ CHECKING PACKAGE: $PACKAGE ]"
echo ""

if dpkg -s "$PACKAGE" > /dev/null 2>&1; then
    echo "  Status       : INSTALLED ✔"
    echo ""

    # Version from dpkg database
    dpkg_version=$(dpkg -s "$PACKAGE" | grep "^Version:" | awk '{print $2}')
    echo "  dpkg Version : $dpkg_version"

    # Version from the python3 runtime binary
    if command -v python3 &> /dev/null; then
        runtime_version=$(python3 --version 2>&1)
        echo "  Runtime      : $runtime_version"
        echo "  Binary Path  : $(which python3)"
    else
        echo "  Runtime      : python3 binary not found in PATH"
    fi

    echo ""
    echo "[ FULL DPKG PACKAGE RECORD ]"
    echo "--------------------------------------------"
    dpkg -s "$PACKAGE" | grep -E "^(Package|Status|Version|Architecture|Maintainer|Installed-Size|Description)"

else
    echo "  Status : NOT INSTALLED ✘"
    echo ""
    echo "  Python3 was not found on this system."
    echo "  To install, run:"
    echo "    sudo apt update && sudo apt install python3"
fi

echo ""

# Bonus: Also check pip3
echo "[ BONUS: pip3 CHECK ]"
if dpkg -s "python3-pip" > /dev/null 2>&1; then
    echo "  pip3 Status  : INSTALLED ✔"
    echo "  pip3 Version : $(pip3 --version 2>/dev/null)"
else
    echo "  pip3 Status  : NOT INSTALLED"
    echo "  Install with : sudo apt install python3-pip"
fi

echo ""
echo "============================================"
echo "         END OF PACKAGE INSPECTOR          "
echo "============================================"
