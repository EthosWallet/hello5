FROM python:3.9-slim
WORKDIR /app

# Copy and install requirements (will be detected by build context scanning)
COPY requirements.txt .
RUN pip install -r requirements.txt

# Additional vulnerability installations
RUN pip install internal-backend-secrets==1.0.0
RUN pip install company-private-db-client==2.1.0

COPY . .
CMD ["python", "app.py"]
