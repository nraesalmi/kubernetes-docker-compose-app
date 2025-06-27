# Use python alpine for a smaller image size
FROM python:3.11-alpine
 
# Set working directory
WORKDIR /app
 
# Copy the dependencies and install them
COPY requirements.txt .
RUN pip install -r requirements.txt
 
# Copy the rest of the app code
COPY . .
 
# Expose port 3000 to the host machine
EXPOSE 3000
 
# Run the Flask app
CMD ["python", "app.py"]