# Base image containing the Java 25 runtime.
# We only need the JRE because Maven already built the application JAR.
FROM eclipse-temurin:25-jre

# Set /app as the working directory inside the container.
WORKDIR /app

# Copy the Spring Boot executable JAR from the host's target/
# directory into the image and rename it to app.jar.
COPY target/document-intelligence-service-0.0.1-SNAPSHOT.jar app.jar

# Copy the startup script into the image.
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Command executed when the container starts.
# Runs the Spring Boot application.
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]