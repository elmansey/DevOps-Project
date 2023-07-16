# Use the official Tomcat image as the base image
FROM tomcat:8-jre11

# Copy your JAR file into the Tomcat webapps directory
COPY target/simple-app.war /usr/local/tomcat/webapps/ROOT.war

# Expose the default Tomcat port (8080)
EXPOSE 8080

# Start Tomcat when the container launches
CMD ["catalina.sh", "run"]
