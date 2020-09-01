#!/bin/bash
if { set -C; 2>/dev/null > /var/www/wow.tools/dbc/scripts/cacheRunning.lock; }; then
        trap "rm -f /var/www/wow.tools/dbc/scripts/cacheRunning.lock" EXIT
else
        echo "Lock file exists… exiting" >&2
        exit
fi

cd /var/www/wow.tools/dbc/scripts/
php updateHotfixes.php
php updateCaches.php