buildgcp:
	./build_gcp.sh :latest $(project-id)

pushgcp:
	./push_to_gcr.sh :latest $(project-id)
