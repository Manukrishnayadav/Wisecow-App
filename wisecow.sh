#!/bin/bash
PORT=4499
echo "Wisdom served on port=${PORT}..."

while true; do
    # Listen on PORT and respond with HTTP
    { 
      echo -e "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\n"
      /usr/games/fortune | /usr/games/cowsay
    } | nc -l -p $PORT -q 1
done
