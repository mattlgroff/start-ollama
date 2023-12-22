#!/bin/bash

# Function to check if Docker is installed and running
check_docker() {
  if ! command -v docker &> /dev/null; then
    echo "Docker command not found. Please ensure Docker is installed and running."
    exit 1
  fi

  if ! docker info > /dev/null 2>&1; then
    echo "Docker is not running. Please start Docker and try again."
    exit 1
  fi
}

# Stops the container and removes the container and volume
cleanup() {
  echo "Stopping and removing the Docker container..."
  docker stop ollama > /dev/null 2>&1
  docker rm ollama > /dev/null 2>&1
  exit 0
}


# Function to check for NVIDIA GPU (CUDA)
has_nvidia_gpu() {
  nvidia-smi > /dev/null 2>&1
  return $?
}

# Trap Ctrl+C (SIGINT) and call cleanup function
trap 'cleanup' SIGINT

# Check if Docker is installed and running
check_docker

# Check for NVIDIA GPU and run the container accordingly
if has_nvidia_gpu; then
  echo "NVIDIA GPU detected. Running with GPU support."
  docker run -it --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
else
  echo "No CUDA compatible GPU found, running without GPU acceleration."
  docker run -it -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
fi

# Wait for the container to exit
wait $!

# Call cleanup at the end in case it was not triggered by SIGINT
cleanup
