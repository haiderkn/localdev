#!/usr/bin/env python3

import click
import os

@click.group()
def mdt():
    """A CLI tool for Docker commands and managing your development environment."""
    pass

# Docker Logs Command
@mdt.command()
@click.argument('service_name')
def logs(service_name):
    """Show logs for a specific Docker service."""
    os.system(f"docker logs -f {service_name}")

# Docker Run Command
@mdt.command()
@click.argument('app')
@click.option('-p', '--port', default='80', help="Port mapping in the format host_port:container_port.")
def run(app, port):
    """Run a Docker container."""
    os.system(f"docker run -it -p {port} {app}")

# Docker Clean Command
@mdt.command()
@click.option('-i', '--image', is_flag=True, help="Clean up unused Docker images.")
@click.option('-e', '--everything', is_flag=True, help="Clean up all unused Docker data.")
def clean(image, everything):
    """Clean up Docker resources."""
    if image:
        os.system("docker image prune -f")
    elif everything:
        os.system("docker system prune -a -f")
    else:
        click.echo("Please specify --image or --everything.")

if __name__ == '__main__':
    mdt(prog_name='mdt')
