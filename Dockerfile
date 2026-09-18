FROM python:3.13-slim
# FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose port 8000 to match Streamlit's port
EXPOSE 8501

# Execute Streamlit with your exact flags
# CMD ["python", "-m", "streamlit", "run", "app.py", "--server.port", "8000", "--server.address", "0.0.0.0","--server.headless", "true"]
# CMD ["streamlit", "run", "app.py", "--server.port=8000", "--server.address=0.0.0.0", "--server.headless=true", "--server.enableCORS=false"]

CMD ["python", "-m", "streamlit", "run", "app.py", \
     "--server.port=8501", \
     "--server.address=0.0.0.0", \
     "--server.headless=true", \
     "--server.enableCORS=false", \
     "--server.enableXsrfProtection=false"]