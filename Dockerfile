

FROM maven AS build

RUN git clone https://github.com/nlsfi/hakunapi.git
WORKDIR /hakunapi

# try build latest 
RUN git fetch origin pull/141/head:recent
RUN git switch recent
#

RUN mvn clean verify -q --fail-never
RUN mvn clean package -Dmaven.test.skip

FROM tomcat

RUN mkdir /usr/local/tomcat/static
COPY tomcat/server.xml /usr/local/tomcat/conf/
COPY tomcat/index.html /usr/local/tomcat/static/

COPY --from=build /hakunapi/webapp-jakarta/hakunapi-simple-webapp-jakarta/target/features.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]

