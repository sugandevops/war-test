FROM tomcat:8.0
LABEL maintainer="sugan.softy@gmail.com"
COPY /target/mywebapp.war /usr/local/tomcat/webapps/
EXPOSE 8080
