FROM centos:centos7

RUN yum update -y && yum upgrade -y
RUN yum install -y java-1.8.0-openjdk 
RUN yum install -y wget
RUN mkdir /usr/local/rundeck/
WORKDIR /usr/local/rundeck
#RUN wget -c http://dl.bintray.com/rundeck/rundeck-maven/rundeck-launcher-2.5.3.jar
RUN wget -c https://dl.bintray.com/rundeck/rundeck-maven/rundeck-3.0.20-20190408.war
RUN useradd -g users -m -s /bin/bash rdk
RUN chown -R rdk:users /usr/local/rundeck
USER rdk
#CMD ["java","-jar","rundeck-launcher-2.5.3.jar"]
CMD ["java","-jar","rundeck-3.0.20-20190408.war"]


