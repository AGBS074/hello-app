FROM python:3.10-slim

# Avoid writing .pyc files & ensure stdout/stderr are unbuffered
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Create non-root user
RUN addgroup --system app && adduser --system --ingroup app app

# Install deps first (better layer caching)
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Drop privileges
USER app

EXPOSE 8000

# Production WSGI server
CMD ["gunicorn", "-b", "0.0.0.0:8000", "app:app"]
