#!/bin/bash

# This script initializes the project structure for our local Kubernetes Jenkins setup.
# It creates all necessary directories and files for a clean and organized repository.

# --- Directory Creation ---
echo "Creating project directories..."
mkdir -p app k8s jenkins/jobs docs

# 'app' will hold our simple web application.
# 'k8s' will contain all our Kubernetes manifest files.
# 'jenkins/jobs' will store Jenkins job configurations.
# 'docs' will house our detailed documentation.

# --- File Creation ---
echo "Creating initial project files..."

# README.md: A general overview of the project.
cat > README.md <<'EOL'
# Local Kubernetes Jenkins and Selenium Grid

This project provides a simple, local Kubernetes setup for running two load-balanced Jenkins servers and a Selenium Grid for automated testing of a web application.

For detailed instructions, please see the `docs/INSTRUCTIONS.md` file.
EOL

# .gitignore: Specifies files and directories that Git should ignore.
cat > .gitignore <<'EOL'
# Ignore system files
.DS_Store
*.swp
*~

# Ignore dependency directories
node_modules/
venv/
__pycache__/

# Ignore build artifacts
*.log
build/
dist/
*.gem
*.egg-info
*.pyc
*.pyo

# Ignore sensitive information
.env
*.pem
*.key
EOL

# build_and_deploy.sh: The main script to build and deploy the application.
touch build_and_deploy.sh
chmod +x build_and_deploy.sh

# INSTRUCTIONS.md: Comprehensive documentation for the project.
touch docs/INSTRUCTIONS.md

# --- Git Repository Initialization ---
echo "Initializing Git repository..."
git init
git add .
git commit -m "Initial project structure and setup files"

echo "Project environment setup complete!"