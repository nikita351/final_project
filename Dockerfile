FROM openjdk:8

EXPOSE 8080

ADD target/spring-petclinic-2.5.0-SNAPSHOT.jar spring-petclinic-2.5.0-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","/spring-petclinic-2.5.0-SNAPSHOT.jar"]

#spring-petclinic-2.5.0-SNAPSHOT.jar

# FROM openjdk:8-jdk-alpine

# VOLUME /tmp

# COPY target/spring-petclinic-2.5.0-SNAPSHOT.jar spring-petclinic-2.5.0-SNAPSHOT.jar

# ENTRYPOINT ["java","-jar","/spring-petclinic-2.5.0-SNAPSHOT.jar"]