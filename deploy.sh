docker build -t gcr.io/ivikramtiwari/cloud-run-api-demo-geo-from-ip .
docker push gcr.io/ivikramtiwari/cloud-run-api-demo-geo-from-ip
gcloud beta run deploy cloud-run-api-demo-geo-from-ip --image gcr.io/ivikramtiwari/cloud-run-api-demo-geo-from-ip --region us-central1 --platform managed
