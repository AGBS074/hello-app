# Day 2 — Hello DevOps (Flask) + Docker

Minimal Flask microservice packaged in a production-grade Docker image (gunicorn, non-root).

## Quickstart

1) Build the image
```bash
docker build -t <dockerhub-username>/hello-app:1.0 .
```

2) Run the container
```bash
docker run --rm -p 8000:8000 <dockerhub-username>/hello-app:1.0
```

3) Test endpoints
```bash
curl http://localhost:8000/
curl http://localhost:8000/healthz
```
Or open http://localhost:8000 in your browser.

4) (Optional) Tag "latest"
```bash
docker tag <dockerhub-username>/hello-app:1.0 <dockerhub-username>/hello-app:latest
```

5) Push to Docker Hub
```bash
docker login
docker push <dockerhub-username>/hello-app:1.0
docker push <dockerhub-username>/hello-app:latest
```

## Notes
- Works the same from WSL2 or PowerShell.
- Container listens on port 8000 (mapped to your host 8000).
- Health endpoint: `/healthz`.
