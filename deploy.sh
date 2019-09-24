docker build -t gcr.io/ivikramtiwari/cloud-run-api-demo .
docker push gcr.io/ivikramtiwari/cloud-run-api-demo
gcloud beta run deploy cloud-run-api-demo --image gcr.io/ivikramtiwari/cloud-run-api-demo --region us-central1 --platform managed
