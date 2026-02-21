FROM eclipse-temurin:21-jre-alpine

# Install curl for downloading Lavalink
RUN apk add --no-cache curl

WORKDIR /app

# Download Lavalink.jar from GitHub releases
ARG LAVALINK_VERSION=4.1.2
RUN curl -fSL "https://github.com/lavalink-devs/Lavalink/releases/download/${LAVALINK_VERSION}/Lavalink.jar" -o Lavalink.jar

# Copy config and plugins
COPY application.yml .
COPY plugins/ ./plugins/

# Expose Lavalink port
EXPOSE 2333

# Start Lavalink with optimized JVM flags for low memory
CMD ["java", "-Xmx256m", "-Xms128m", "-jar", "Lavalink.jar"]
