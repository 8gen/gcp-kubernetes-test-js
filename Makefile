create:
	gcloud container builds submit --tag gcr.io/metal-map-159912/hello-world-js-1 .
	gcloud container clusters create hello-world-js-1
	kubectl create -f deployment.yml --save-config
	kubectl create -f service.yml --save-config
	kubectl create -f hpa.yaml --save-config  

delete:
	kubectl delete service/hello-world-js-1
	kubectl delete deployment/hello-world-js-1
	kubectl delete hpa/hello-world-js-1
	gcloud container clusters delete hello-world-js-1
