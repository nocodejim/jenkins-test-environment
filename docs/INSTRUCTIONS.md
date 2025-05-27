# Instructions for Local Kubernetes Jenkins and Selenium Grid

This document provides a comprehensive guide to setting up, deploying, and using this project.

## 1. Prerequisites

Before you begin, ensure you have the following installed and configured:

* **WSL 2 (Windows Subsystem for Linux):** This project is designed to be run from a WSL 2 environment, specifically the Ubuntu 24.04 distribution.
* **Docker Desktop:** Install Docker Desktop for your operating system and enable the Kubernetes cluster in the settings.
* **VSCode:** A powerful and recommended editor for working with this project. The "Remote - WSL" extension is highly recommended.

## 2. Project Setup

To get started, simply run the `setup_environment.sh` script from your WSL terminal in your desired project directory:

```bash
./setup_environment.sh
This will create the entire project structure and initialize a Git repository.

3. Understanding the Architecture
Kubernetes: We use Kubernetes to orchestrate our application containers. This allows for scalability, self-healing, and easy management of our services.
Jenkins: An open-source automation server that we use to run our tests. We are deploying two instances of Jenkins for high availability, with a LoadBalancer to distribute traffic between them.
Selenium Grid: A tool that allows us to run browser tests in parallel on multiple machines. We have a central "Hub" and multiple "Nodes" (in this case, Chrome browsers).
Persistent Volume: The PersistentVolumeClaim ensures that our Jenkins data (jobs, logs, etc.) is not lost if the Jenkins pods restart.
4. Building and Deploying
The build_and_deploy.sh script automates the entire process:

Bash

./build_and_deploy.sh
This script will:

Check for Docker and kubectl.
Build the Docker image for the web application.
Deploy all the necessary Kubernetes resources (Deployments, Services, etc.).
5. Accessing Jenkins and Running Tests
Find the Jenkins URL: After a few moments, you can get the external IP address of the Jenkins service by running:

Bash

kubectl get svc -n jenkins jenkins-lb
The EXTERNAL-IP will likely be localhost. You can access Jenkins at http://localhost:8080.

Unlock Jenkins: The first time you access Jenkins, you will need to provide an initial admin password. You can get this by running:

Bash

kubectl exec -n jenkins -it $(kubectl get pods -n jenkins -l app=jenkins -o jsonpath='{.items[0].metadata.name}') -- cat /var/jenkins_home/secrets/initialAdminPassword
Configure Jenkins: Follow the on-screen instructions to complete the Jenkins setup.

Create a Test Job:

In Jenkins, create a new "Freestyle project".
In the "Build" section, add a build step to "Execute shell" and add a command to run your Selenium tests. You will need to configure your Jenkins job to check out your code from your Git repository.
6. GitHub Best Practices
Branching: Always create a new branch for each new feature or bug fix. Never commit directly to the main branch.
Bash

git checkout -b new-feature
Pull Requests (PRs): When your feature is complete, open a Pull Request to merge your branch into main. This allows for code review and automated checks before merging.
Versioning: Use semantic versioning (e.g., v1.2.3) for your releases. Create tags in Git to mark release points.
Bash

git tag -a v1.0.0 -m "Initial release"
git push origin v1.0.0
Documentation: Keep your README.md and other documentation up-to-date with any changes.
7. Security Considerations
Dependabot: Enable Dependabot on your GitHub repository to automatically get alerts for vulnerable dependencies.
Secrets Management: Do not hardcode secrets (like passwords or API keys) in your code. Use Kubernetes Secrets or a tool like HashiCorp Vault.
Image Scanning: Integrate a container image scanner into your CI/CD pipeline to check for vulnerabilities in your Docker images.