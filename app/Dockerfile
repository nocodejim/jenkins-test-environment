# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install any needed packages specified in requirements.txt
# For this simple app, Flask is the only dependency.
# In a real application, you would have a requirements.txt file:
# COPY requirements.txt .
# RUN pip install -r requirements.txt
RUN pip install Flask

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable (Corrected format)
ENV NAME=World

# Run app.py when the container launches
CMD ["python", "app.py"]
