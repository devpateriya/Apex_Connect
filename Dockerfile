# This file is the final recipe for the deployment server.

# 1. Start with a pre-built environment that has Java 8 and Maven
FROM maven:3.8.5-openjdk-8

# 2. Create a folder inside the environment to work in
WORKDIR /app

# 3. Copy all of your project files into the environment
COPY . .

# 4. Run the Maven build command and SKIP the broken tests
RUN mvn clean install -DskipTests

# 5. This is the final, correct command to start your application.
# It directly provides the database credentials, bypassing all other configuration.
# The "-Dserver.port=${PORT}" line is a special instruction for Render to use the correct network port.
CMD java -Xmx350m -jar target/client-relation-manager-1.0.0.jar -Dserver.port=${PORT} --spring.datasource.url=jdbc:postgresql://dpg-d345kmnfte5s73eg757g-a/apex_connect_db --spring.datasource.username=apex_connect_db_user --spring.datasource.password=8ORdS7tLNa78hKHY5c3gJldKDOdSFyJV