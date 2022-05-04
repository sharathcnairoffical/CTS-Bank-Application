FROM openjdk:11
EXPOSE 8090
COPY ./target/rules-service.jar rules-service.jar 
ENTRYPOINT ["java","-jar","/rules-service.jar"]