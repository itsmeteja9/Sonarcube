FROM sonarqube:10.6-community

WORKDIR /opt/sonarqube/extensions/plugins/

# Copy the plugins into the working directory
COPY ./plugins /opt/sonarqube/extensions/plugins/

# Expose the default SonarQube port
EXPOSE 6000
WORKDIR /opt/sonarqube
# Start SonarQube
ENTRYPOINT ["/opt/sonarqube/docker/entrypoint.sh"]
