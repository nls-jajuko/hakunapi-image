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

Try this to get the recent  [#141](https://github.com/nlsfi/hakunapi/pull/141) hakunapi offset support
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


Try this to get OpenStreetmap background maps and templates. 

```
docker pull ghcr.io/nls-jajuko/hakunapi-image:release

# sample datasets
git clone https://github.com/nls-jajuko/hakunapi-image.git

# openstreetmap templates for html
git clone https://github.com/nls-jajuko/hakunapi-html-cdn-leaflet.git --branch openstreetmap
echo "formats.html.dir=/templates" >> ./hakunapi-image/gpkg/simple_addresses.properties

docker run --publish 8080:8080 \
  -v ./hakunapi-html-cdn-leaflet/templates:/templates \
  -v ./hakunapi-image/gpkg:/app \
  -e FEATURES_BASEURL="http://localhost:8080/features" \
  -e HAKUNAPI_CONFIG_PATH="/app/simple_addresses.properties" \
  ghcr.io/nls-jajuko/hakunapi-image:release

```



