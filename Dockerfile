FROM openjdk:8

EXPOSE 8080

COPY target/spring-petclinic-2.5.0-SNAPSHOT.jar spring-petclinic-2.5.0-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","/spring-petclinic-2.5.0-SNAPSHOT.jar"]

#spring-petclinic-2.5.0-SNAPSHOT.jar

