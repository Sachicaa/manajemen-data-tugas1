#!/bin/bash
THRESHOLD=80
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
echo "============================="
echo "📊 Monitoring Space HDD"
echo "============================="
df -h /
echo "Terpakai: ${USAGE}%"
if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "⚠️ PERINGATAN! Space HDD tinggal $((100 - USAGE))%"
else
    echo "✅ Space HDD aman, sisa $((100 - USAGE))%"
fi
