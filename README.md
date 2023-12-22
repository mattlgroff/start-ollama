# Ollama Container Startup Script

This README provides instructions for using the `start-ollama.sh` script to run the Ollama Docker container. This script checks for the presence of an NVIDIA GPU and decides whether to run the Docker container with or without GPU support.

## Prerequisites

Before running the script, ensure the following prerequisites are met:

1. **Docker**: Docker must be installed and running on your system. Visit [Docker's website](https://docs.docker.com/get-docker/) for installation instructions.
2. **NVIDIA Drivers and CUDA** (optional): For GPU support, ensure you have NVIDIA drivers and CUDA installed on your system. This is only required for systems with an NVIDIA GPU.

## Installation

No additional installation is needed for the script. Just ensure that you have Docker installed on your system.

## Running the Script

1. **Download the Script**: If you haven't already, download or clone the `start-ollama.sh` script to your local machine.

2. **Make the Script Executable**:
   Open a terminal and navigate to the directory containing the `start-ollama.sh` script. Run the following command to make the script executable:
   ```bash
   chmod +x start-ollama.sh
   ```

3. **Run the Script**:
   In the terminal, execute the script by running:
   ```bash
   ./start-ollama.sh
    ```
   The script will automatically check for an NVIDIA GPU. If an NVIDIA GPU is detected, it will start the Ollama container with GPU support. Otherwise, it will run without GPU acceleration.

4. **Stopping the Script**:
   To stop the script and the running Docker container, press Ctrl+C in the terminal where the script is running. The script will handle the graceful shutdown and removal of the Docker container.

## Troubleshooting

- **Docker Not Found**: If you receive an error indicating that Docker is not found, please ensure that Docker is installed and running.
- **NVIDIA GPU Detection**: If the script does not detect your NVIDIA GPU, ensure that the drivers and CUDA are correctly installed.
- **Permission Issues**: If you encounter permission issues, make sure you have the necessary permissions to run Docker commands on your system.