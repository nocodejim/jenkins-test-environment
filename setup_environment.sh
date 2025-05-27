#!/bin/bash

# This script initializes the complete project structure for our local Kubernetes Jenkins setup.
# It creates all necessary directories and empty placeholder files to prevent naming errors.
# The user's next step is to populate these files with the provided code.

# --- Start of Script ---
echo "Starting project setup..."
echo "This will create the full directory structure and all necessary (empty) files."
echo

# --- Directory Creation ---
echo "Step 1: Creating project directories..."
mkdir -p app k8s jenkins/jobs docs
echo "  - Directories 'app', 'k8s', 'jenkins/jobs', and 'docs' created."
echo

# --- Root File Creation ---
echo "Step 2: Creating root-level files..."

# README.md: A general overview of the project (with content).
cat > README.md <<'EOL'
# Local Kubernetes Jenkins and Selenium Grid

This project provides a simple, local Kubernetes setup for running two load-balanced Jenkins servers and a Selenium Grid for automated testing of a web application.

## Setup

1.  Run the `setup_environment.sh` script to create all necessary directories and files.
2.  Populate the created files with the code provided in the solution documentation.
3.  For detailed instructions on building, deploying, and using the project, please see the `docs/INSTRUCTIONS.md` file.
EOL
echo "  - README.md (with content)"

# .gitignore: Specifies files and directories that Git should ignore (with content).
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
echo "  - .gitignore (with content)"

# build_and_deploy.sh: The main script to build and deploy (created empty).
touch build_and_deploy.sh
chmod +x build_and_deploy.sh
echo "  - build_and_deploy.sh (empty, executable)"
echo

# --- Application File Creation ---
echo "Step 3: Creating application placeholder files in 'app/'..."
touch app/app.py
touch app/Dockerfile
echo "  - app/app.py (empty)"
echo "  - app/Dockerfile (empty)"
echo

# --- Kubernetes Manifest Creation ---
echo "Step 4: Creating Kubernetes manifest placeholder files in 'k8s/'..."
touch k8s/jenkins-namespace.yaml
touch k8s/jenkins-pvc.yaml
touch k8s/jenkins-deployment.yaml
touch k8s/jenkins-service.yaml
touch k8s/selenium-grid-deployment.yaml
touch k8s/selenium-grid-service.yaml
echo "  - k8s/jenkins-namespace.yaml (empty)"
echo "  - k8s/jenkins-pvc.yaml (empty)"
echo "  - k8s/jenkins-deployment.yaml (empty)"
echo "  - k8s/jenkins-service.yaml (empty)"
echo "  - k8s/selenium-grid-deployment.yaml (empty)"
echo "  - k8s/selenium-grid-service.yaml (empty)"
echo

# --- Documentation File Creation ---
echo "Step 5: Creating documentation placeholder file in 'docs/'..."
touch docs/INSTRUCTIONS.md
echo "  - docs/INSTRUCTIONS.md (empty)"
echo

# --- Git Repository Initialization ---
echo "Step 6: Initializing Git repository..."
git init
git add .
git commit -m "feat: Initial project structure with all placeholder files"
echo "  - Git repository initialized and initial commit created."
echo

# --- Final Message ---
echo "--------------------------------------------------------"
echo "Project environment setup complete!"
echo "Your next step is to copy and paste the code for each file."
echo "You can now open the project folder in VSCode."
echo "--------------------------------------------------------"