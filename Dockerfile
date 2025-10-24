# Use Ubuntu 22.04 as base
FROM ubuntu:22.04

# Install prerequisites
RUN apt-get update && \
    apt-get install -y software-properties-common netcat-openbsd && \
    add-apt-repository universe && \
    apt-get update && \
    apt-get install -y fortune-mod cowsay && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy your script
COPY wisecow.sh .

# Make it executable
RUN chmod +x wisecow.sh

# Expose the port
EXPOSE 4499

# Run the script
CMD ["./wisecow.sh"]