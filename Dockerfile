From openjdk:8u201-jre-alpine3.9

RUN apk add curl jq

# Workspace
WORKDIR /usr/share/udemy

# ADD .jar under target from host
# into this image
ADD target/docker-selenium.jar 			docker-selenium.jar
ADD target/docker-selenium-tests.jar 	docker-selenium-tests.jar
ADD target/libs							libs

# in case of any other dependency like .csv / .json / .xls
# please ADD that as well

# ADD suite files
ADD book-flight-module.xml				book-flight-module.xml
ADD search-module.xml					search-module.xml

# ADD health check script
ADD healthcheck.sh                      healthcheck.sh
RUN dos2unix                            healthcheck.sh

# Environment Variables
# HUB_HOST
# BROWSER
# MODULE
ENTRYPOINT sh healthcheck.sh