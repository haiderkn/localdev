# LocalDev Setup and Python Wrapper Tool

## Overview
The `localdev` directory contains a Docker setup for local development, which helps you run the development environment seamlessly using Docker Compose. Additionally, the Python-based `mdt` CLI wrapper tool simplifies common Docker commands to make development smoother.

## Directory Structure
```
localdev/
├── docker-compose-localdev.yml   # Docker Compose file for local development
├── mdt.py                        # Python wrapper tool for Docker commands
└── README.md                     # This readme file
```

## Prerequisites
1. **Docker**: Make sure Docker is installed and running on your machine. You can follow the installation instructions [here](https://docs.docker.com/get-docker/).
2. **Python 3**: Ensure Python 3 is installed. You can check your installation by running:
    ```bash
    python3 --version
    ```

## Getting Started

### 1. Install the Python CLI Tool
The `mdt` CLI tool simplifies common Docker operations. To set it up:
```bash
chmod +x install_mdt.sh
./install_mdt.sh
```

### 2. Using the `mdt` Tool
The `mdt` tool wraps several Docker commands. Here’s how you can use it:

#### Logs
Get the logs of a specific Docker service:
```bash
mdt logs <service_name>
```
Example:
```bash
mdt logs django-app
```

#### Run
Run a Docker container with the specified host port (container port is auto-detected):
```bash
mdt run <app_name> -p <host_port>
```
Example:
```bash
mdt run backend-service -p 8080
```

#### Clean
Clean up unused Docker images or everything (containers, networks, volumes, images):
```bash
mdt clean --image     # Clean unused Docker images
mdt clean --everything # Clean everything
```

### 3. Running the Local Development Environment
To start the development environment using Docker Compose:
1. In the `localdev` directory, run:
    ```bash
    docker-compose -f docker-compose-localdev.yml up -d
    ```

This will start the services (e.g., `django-app`, `db`) defined in `docker-compose-localdev.yml`.

### 4. Stopping the Local Development Environment
To stop and remove the containers:
```bash
docker-compose -f docker-compose-localdev.yml down
```

## Conclusion
With the `mdt` wrapper tool and Docker Compose, managing your development environment becomes easy and efficient. Simply use the `mdt` commands to interact with your services, run containers, and clean up resources when needed.

For further customization or troubleshooting, feel free to modify the `docker-compose-localdev.yml` and `mdt.py` files as per your project requirements.
