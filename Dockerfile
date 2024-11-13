FROM sonarqube:10.6-community

EXPOSE 7000
COPY ./plugins /opt/sonarqube/extensions/plugins/
# Start SonarQube
CMD ["bin/sonar.sh"]
