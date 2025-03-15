# hakunapi-image

hakunapi container image

```
docker pull ghcr.io/nls-jajuko/hakunapi-image:release
git clone https://github.com/nls-jajuko/hakunapi-image.git

docker run --publish 8080:8080 -v ./hakunapi-image/gpkg:/app -e HAKUNAPI_CONFIG_PATH="/app/simple_addresses.properties" ghcr.io/nls-jajuko/hakunapi-image:release

```

