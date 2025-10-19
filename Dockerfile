# This is the final, correct recipe for the deployment server.

# 1. Start with a pre-built environment that has Java 8 and Maven
FROM maven:3.8.5-openjdk-8

# 2. Set the working directory
WORKDIR /app

# 3. Copy all of your project files
COPY . .

# 4. Run the Maven build command and skip the tests
RUN mvn clean install -DskipTests

# 5. This is the final, correct command to start your application.
# It directly provides the NEW database credentials, bypassing all other configuration.
# The "-Dserver.port=${PORT}" line is a special instruction for Render to use the correct network port.
CMD java -Xmx350m -jar target/client-relation-manager-1.0.0.jar -Dserver.port=${PORT} --spring.datasource.url=jdbc:postgresql://dpg-d3q73eqli9vc73c3v53g-a/apex_connect_db_final --spring.datasource.username=apex_connect_db_final_user --spring.datasource.password=3bAWp68c6GvGDhWBJbHJabfDF2xjzo1k