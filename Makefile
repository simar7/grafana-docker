buildgcp:
	./build_gcp.sh :latest $(project-id)

pushgcp:
	./push_to_gcr.sh :latest $(project-id)

expose:
	kubectl expose deployment grafana --type=LoadBalancer --name=grafana-http-lb --port 3000

