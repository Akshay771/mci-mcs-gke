## Use an official Python runtime as a parent image
#FROM python:3.9-slim
#
## Set the working directory to /app
#WORKDIR /app
#
## Copy the current directory contents into the container at /app
#COPY . /app
#
## Install any needed packages specified in requirements.txt
#RUN pip install --no-cache-dir -r requirements.txt
#
## Expose port 5000
#EXPOSE 5000
#
## Define environment variable
#ENV FLASK_APP wsgi.py
#ENV REGION=Europe
## Run flask when the container launches
#CMD ["flask", "run", "--host=0.0.0.0"]

# Use an official Python runtime as a parent image
FROM python:3.8-buster

# Set the working directory to /app
WORKDIR /app

# Install build dependencies
RUN apt-get update && \
    apt-get install -y gcc libpcre3-dev && \
    rm -rf /var/lib/apt/lists/*

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV REGION=Europe

# Run app.py when the container launches
CMD ["uwsgi", "--ini", "uwsgi.ini"]
#CMD ["python", "wsgi.py"]