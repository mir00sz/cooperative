FROM wtanaka/ubuntu-1604-oracle-java-9
MAINTAINER m.bartold

RUN java -version
RUN javac -version

COPY ./target/cooperative-0.0.1-SNAPSHOT.jar /usr/src/myapp/cooperative.jar
CMD ["java", "-Dspring.profiles.active=container", "-jar", "/usr/src/myapp/cooperative.jar"]