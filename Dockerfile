FROM python:3.9-slim

# Prevent Python from writing .pyc files to disk
ENV PYTHONDONTWRITEBYTECODE=1

# Ensure stdout/stderr is printed directly
ENV PYTHONUNBUFFERED=1         

# Set working directory
WORKDIR /app

# Install system dependencies (e.g., gcc for compilation)
RUN apt-get update && apt-get install -y gcc

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django project into the container
COPY . /app/

# Expose port 8000 to the host
EXPOSE 8000

# Run Django development server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]


