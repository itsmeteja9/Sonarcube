FROM sonarqube:latest

EXPOSE 9099

# Start SonarQube
CMD ["bin/run.sh"]
