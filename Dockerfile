FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose port 8000 to match Streamlit's port
EXPOSE 8000

# Execute Streamlit with your exact flags
CMD ["python", "-m", "streamlit", "run", "app.py", "--server.port", "8000", "--server.address", "0.0.0.0"]