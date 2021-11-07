FROM openjdk:8

EXPOSE 8080

ADD target/spring-petclinic-2.5.0-SNAPSHOT.jar spring-petclinic-2.5.0-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","/spring-petclinic-2.5.0-SNAPSHOT.jar"]

#spring-petclinic-2.5.0-SNAPSHOT.jar

# FROM openjdk
# COPY target/*.jar /
# EXPOSE 8080
# ENTRYPOINT ["java","-jar","/my-app-1.0-SNAPSHOT.jar"]