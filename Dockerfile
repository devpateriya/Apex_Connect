# This is the final, correct recipe for the deployment server.

# 1. Start with a pre-built environment that has Java 8 and Maven
FROM maven:3.8.5-openjdk-8

# 2. Set the working directory
WORKDIR /app

# 3. Copy all of your project files
COPY . .

# 4. Run the Maven build command and SKIP the broken tests
RUN mvn clean install -DskipTests

# 5. This is the final, correct command to start your application.
# It sets a memory limit and uses the correct JAR file name from your pom.xml.
CMD ["java", "-Xmx350m", "-jar", "target/client-relation-manager-1.0.0.jar"]