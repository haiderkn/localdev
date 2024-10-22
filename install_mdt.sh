#!/bin/bash

# Check if Python3 is installed
if ! command -v python3 &> /dev/null
then
    echo "Python3 is not installed. Please install Python3 and try again."
    exit
fi

# Create a Python virtual environment in the current directory if it doesn't already exist
if [ ! -d "./env" ]; then
    echo "Creating Python virtual environment..."
    python3 -m venv env
else
    echo "Virtual environment already exists."
fi

# Activate the virtual environment
source ./env/bin/activate

# Install 'click' package in the virtual environment
if ! pip3 show click &> /dev/null; then
    echo "Installing click in the virtual environment..."
    pip3 install click
else
    echo "Click is already installed in the virtual environment."
fi

# Path to mdt.py file
MDT_FILE="./mdt.py"

# Add Python shebang to mdt.py if it's not already there
if ! grep -q "#!/usr/bin/env python3" "$MDT_FILE"; then
    echo "Adding shebang to mdt.py"
    sed -i '1i#!/usr/bin/env python3' "$MDT_FILE"
else
    echo "Shebang already present in mdt.py"
fi

# Make the script executable
chmod +x "$MDT_FILE"
echo "Made mdt.py executable"

# Detect the shell (Bash or Zsh) and add alias accordingly
if [[ $SHELL == *"bash"* ]]; then
    SHELL_CONFIG="$HOME/.bashrc"
elif [[ $SHELL == *"zsh"* ]]; then
    SHELL_CONFIG="$HOME/.zshrc"
else
    echo "Unsupported shell. Please use Bash or Zsh."
    exit
fi

# Add alias to shell configuration if it's not already present
if ! grep -q "alias mdt=" "$SHELL_CONFIG"; then
    echo "Adding alias to $SHELL_CONFIG"
    echo "alias mdt='source $(pwd)/env/bin/activate && $(pwd)/mdt.py'" >> "$SHELL_CONFIG"
else
    echo "Alias for mdt already present in $SHELL_CONFIG"
fi

# Reload shell configuration
source "$SHELL_CONFIG"

echo "Setup complete! You can now use the 'mdt' command with the virtual environment activated."
