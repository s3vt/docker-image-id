# Docker image ID
A Github action to retrieve the image id for an image name.

This is useful if you want to check if images have been updated (comparing new vs old id). Mostly in case of images that are being used as base image in your image and you would like to re-create your image if the base image has changed.

## Usage

```yml
  - name: Image ID
    id: image-id
    uses: s3vt/image-id-action@v1.0.0
    with:
      image_name: "s3vt/java:18"
```

This can be used in sample projects as 

```yml
on:
  push:

jobs:
  image-query:
    runs-on: ubuntu-latest
    name: Get Image ID
    steps:
      - name: Image ID
        id: image-id
        uses: s3vt/image-id-action@v1.0.0
        with:
          image_name: "s3vt/java:17"
      - name: Print the image ID
        run: echo "Image ID is ${{ steps.image-id.outputs.image_id }}"
     
```


### Action inputs

| Name | Description | Default |
| --- | --- | --- |
| `image_name` | (**required**) Name of the image for which ID is to be retrieved.. | alpine:latest |


### Action output

| Name | Description | 
| --- | --- | 
| `image_id` | ID of the image requested. |
