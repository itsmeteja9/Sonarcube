FROM sonarqube:10.6-community

EXPOSE 9099
COPY ./plugins /opt/sonarqube/extensions/plugins/
# Start SonarQube
CMD ["bin/sonar.sh"]
