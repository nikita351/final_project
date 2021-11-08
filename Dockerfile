FROM openjdk:8-jdk-alpine

VOLUME /tmp

COPY target/spring-petclinic-2.5.0-SNAPSHOT.jar spring-petclinic-2.5.0-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","/spring-petclinic-2.5.0-SNAPSHOT.jar"]