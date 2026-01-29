FROM maven:3.9.11-eclipse-temurin-21-noble

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y git

WORKDIR /opt/app
RUN git clone -b develop https://github.com/Nibiru-Home/bank-back.git

WORKDIR /opt/app/bank-back
RUN mvn clean package -DskipTests

EXPOSE 8080

CMD ["java", "-jar", "target/bank-back-0.0.1-SNAPSHOT.jar"]
