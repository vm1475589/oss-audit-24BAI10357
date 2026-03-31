#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Course: Open Source Software (Auditing Python)
# Description: Displays distro, kernel, user, uptime, and
#              OS license information.
# ============================================================

echo "============================================"
echo "         SYSTEM IDENTITY REPORT            "
echo "============================================"
echo ""

# --- Distribution ---
echo "[ DISTRIBUTION ]"
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "  Name        : $NAME"
    echo "  Version     : $VERSION"
    echo "  ID          : $ID"
    echo "  Pretty Name : $PRETTY_NAME"
else
    echo "  Distribution info not available."
fi
echo ""

# --- Kernel ---
echo "[ KERNEL ]"
echo "  Release      : $(uname -r)"
echo "  Full Version : $(uname -v)"
echo "  Architecture : $(uname -m)"
echo "  Hostname     : $(uname -n)"
echo ""

# --- Current User ---
echo "[ CURRENT USER ]"
echo "  Username : $(whoami)"
echo "  Home Dir : $HOME"
echo "  Shell    : $SHELL"
echo ""

# --- Uptime ---
echo "[ SYSTEM UPTIME ]"
echo "  $(uptime -p)"
echo "  System up since: $(uptime -s)"
echo ""

# --- OS License ---
echo "[ OS LICENSE ]"
if [ -f /usr/share/common-licenses/GPL-2 ]; then
    echo "  License File : /usr/share/common-licenses/GPL-2"
    echo "  License Type : GNU General Public License v2 (GPL-2)"
    echo "  Note         : Ubuntu is distributed under the GPL and related open-source licenses."
    echo "  License Dir  : /usr/share/common-licenses/"
elif [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "  License info from /etc/os-release:"
    echo "  Home URL     : ${HOME_URL:-N/A}"
    echo "  Support URL  : ${SUPPORT_URL:-N/A}"
    echo "  Bug Reports  : ${BUG_REPORT_URL:-N/A}"
else
    echo "  Ubuntu is distributed under the GPL and related open-source licenses."
fi

echo ""
echo "============================================"
echo "           END OF REPORT                   "
echo "============================================"
