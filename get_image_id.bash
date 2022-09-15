#!/bin/bash

function egzit () { echo $1; exit $2; }

IMAGE_NAME=$1

if [ -z $IMAGE_NAME ]; then egzit "Image Name is required" 1 ; fi

docker pull -q $1 2>&1

if [ $? -ne 0 ]; then egzit "Could not fetch image" 1 ; fi

image_id=$(docker images --filter=reference=$1 --format "{{.ID}}")

echo "::set-output name=image_id::$(echo $image_id)"
