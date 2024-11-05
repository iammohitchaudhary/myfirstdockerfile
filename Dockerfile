# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1  # Prevents Python from writing .pyc files to disk
ENV PYTHONUNBUFFERED=1         # Ensures stdout/stderr is printed directly

# Set working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django project into the container
COPY . /app/

# Expose port 8000 to the host
EXPOSE 8000

# Run Django development server (or specify other commands in docker-compose)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

