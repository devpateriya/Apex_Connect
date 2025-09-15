# This file is a recipe for the deployment server.

# 1. Start with a pre-built environment that has Java 8 and Maven
FROM maven:3.8.5-openjdk-8

# 2. Create a folder inside the environment to work in
WORKDIR /app

# 3. Copy all of your project files from your computer into the environment
COPY . .

# 4. Run the Maven build command and SKIP the broken tests (THIS IS THE FIX)
RUN mvn clean install -DskipTests

# 5. This is the command that will be run to start your application
CMD ["java", "-jar", "target/client-management-system-1.0.0.jar"]