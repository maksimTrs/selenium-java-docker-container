FROM maven:3.8.3-jdk-8

WORKDIR /app/demotest

COPY pom.xml /app/demotest

# Get a clean build immediately after and 'go-offline' to improve subsequent builds
RUN cd /app/demotest && mvn dependency:go-offline

COPY src /app/demotest/src


CMD ["mvn", "-Dtest=DemoTest", "test"]

# docker compose up  --build
# docker compose down