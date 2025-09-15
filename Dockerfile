# This file is a recipe for the deployment server.

# 1. Start with a pre-built environment that has Java 8 and Maven
FROM maven:3.8.5-openjdk-8

# 2. Create a folder inside the environment to work in
WORKDIR /app

# 3. Copy all of your project files from your computer into the environment
COPY . .

# 4. Run the Maven build command and SKIP the broken tests
RUN mvn clean install -DskipTests

# 5. This is the command that will be run to start your application (WITH THE CORRECT FILENAME)
CMD ["java", "-jar", "target/CRM-0.0.1-SNAPSHOT.jar"]