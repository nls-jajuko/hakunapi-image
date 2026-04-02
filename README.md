# hakunapi-image

hakunapi container image with some sample gpkg datasources

```
docker pull ghcr.io/nls-jajuko/hakunapi-image:release

# sample datasets
git clone https://github.com/nls-jajuko/hakunapi-image.git

docker run --publish 8080:8080 \
  -v ./hakunapi-image/gpkg:/app \
  -e FEATURES_BASEURL="http://localhost:8080/features" \
  -e HAKUNAPI_CONFIG_PATH="/app/simple_addresses.properties" \
  ghcr.io/nls-jajuko/hakunapi-image:release

```

Try this to get the  [#141](https://github.com/nlsfi/hakunapi/pull/141) hakunapi offset support
```
docker pull ghcr.io/nls-jajuko/hakunapi-image:release

# sample datasets (with offset parameter support)
git clone https://github.com/nls-jajuko/hakunapi-image.git
echo "collections.simple_addresses.pagination.strategy=hybrid" >> ./hakunapi-image/gpkg/simple_addresses.properties

docker run --publish 8080:8080 \
  -v ./hakunapi-image/gpkg:/app \
  -e FEATURES_BASEURL="http://localhost:8080/features" \
  -e HAKUNAPI_CONFIG_PATH="/app/simple_addresses.properties" \
  ghcr.io/nls-jajuko/hakunapi-image:release
```





