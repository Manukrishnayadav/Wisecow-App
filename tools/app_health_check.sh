#!/bin/bash
# Simple health check for Wisecow app

PORT=4499
HOST=localhost

echo "Checking if Wisecow app is running on $HOST:$PORT..."

STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://$HOST:$PORT)

if [ "$STATUS" -eq 200 ]; then
    echo "✅ Wisecow app is UP and responding with HTTP 200"
else
    echo "❌ Wisecow app is DOWN or not responding (HTTP code: $STATUS)"
fi
