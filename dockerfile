# Use official Python image
FROM python:3.10

# Set work directory
WORKDIR /app

# Copy dependencies first (optimizes caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Expose the correct port
EXPOSE 8000

# Use a non-root user (security best practice)
RUN useradd -m appuser
USER appuser

# Command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "banking_system.wsgi:application"]
