#!/bin/bash

_grafana_tag=$1
_grafana_version=${_grafana_tag:1}

_project_id=$2

if [ "$_project_id" == "" ]; then
    echo "Provide the GCP project ID"
    echo "example usage: ./push_to_gcr.sh :latest random-project-id"
    exit 1
fi

if [ "$_grafana_version" != "" ]; then
	echo "pushing grafana/grafana:${_grafana_version}"
	gcloud docker -- push gcr.io/${_project_id}/grafana/grafana:${_grafana_version}
	gcloud docker -- push gcr.io/${_project_id}/grafana/grafana:latest
else
	echo "pushing grafana/grafana:master"
	gcloud docker -- push gcr.io/${_project_id}/grafana/grafana:master
fi
