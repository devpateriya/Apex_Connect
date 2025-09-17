
# 1. Start with a pre-built environment that has Java 8 and Maven
FROM maven:3.8.5-openjdk-8

# 2. Set the working directory
WORKDIR /app

# 3. Copy all of your project files
COPY . .

# 4. Run the Maven build command and skip the tests
RUN mvn clean install -DskipTests

# 5. Make our new start.sh script executable
RUN chmod +x start.sh

# 6. Set the start command to run our new script
CMD ["./start.sh"]
```