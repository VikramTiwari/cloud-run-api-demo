docker build -t gcr.io/ivikramtiwari/cloud-run-api-demo-geo-from-ip-env .
docker push gcr.io/ivikramtiwari/cloud-run-api-demo-geo-from-ip-env
gcloud beta run deploy cloud-run-api-demo-geo-from-ip-env --image gcr.io/ivikramtiwari/cloud-run-api-demo-geo-from-ip-env --region us-central1 --platform managed --update-env-vars SECRET_TOKEN=42
