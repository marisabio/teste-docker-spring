FROM alpine:latest
LABEL authors="mari"

RUN apk upgrade --available
RUN apk add openjdk17
RUN addgroup -g 1000 -S usrapp
RUN adduser -S -G usrapp -u 1000 -s /bin/bash -h home usrapp
USER usrapp
WORKDIR /home/usrapp/app
ADD target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

EXPOSE 8080