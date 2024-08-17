# Use a base image that matches your binary's architecture
FROM debian:bookworm-slim

USER root

# Copy the binary and its dependent folders into the container
COPY ./www-bin /app/

WORKDIR /app/

# Make the binary executable
RUN chmod +x /app/www-bin

# Expose port 8080
EXPOSE 4441

# Command to run the binary
CMD ["./www-bin"]
