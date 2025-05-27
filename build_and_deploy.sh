#!/bin/bash

# This script builds the Docker image for our web application and deploys it
# along with Jenkins and Selenium Grid to the local Kubernetes cluster.

# --- Dependency Check ---
echo "Checking for dependencies..."

# Check for Docker
if ! [ -x "$(command -v docker)" ]; then
  echo 'Error: Docker is not installed.' >&2
  # Instructions to install Docker can be added here
  exit 1
fi

# Check for kubectl
if ! [ -x "$(command -v kubectl)" ]; then
  echo 'Error: kubectl is not installed.' >&2
  # Instructions to install kubectl can be added here
  exit 1
fi

# --- Docker Image Build ---
echo "Building the web app Docker image..."
docker build -t my-web-app:latest ./app

# --- Kubernetes Deployment ---
echo "Deploying to Kubernetes..."

# Create the namespace first
kubectl apply -f k8s/jenkins-namespace.yaml

# Apply all other Kubernetes manifests
kubectl apply -f k8s/

echo "Deployment complete!"
echo "You can access the Jenkins load balancer at the external IP provided by 'kubectl get svc -n jenkins jenkins-lb'"