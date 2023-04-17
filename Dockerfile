FROM openjdk:11
VOLUME /tmp
ADD target/spring-postgresql-app-0.0.1.jar spring-postgresql-app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/spring-postgresql-app.jar"]
