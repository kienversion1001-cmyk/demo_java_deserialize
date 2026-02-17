FROM ghcr.io/cyberjutsu/maven-tomcat-jdk:3.6.3-8.5.35-8.0.131-open

RUN echo "{FAKE_FLAG}" >> /flag && chmod 444 /flag

USER root
WORKDIR /usr/local/tomcat
ENV PATH=$PATH:/usr/local/tomcat
COPY --chown=root:root ./src /usr/local/tomcat
RUN chmod +x /usr/local/tomcat/build.sh && /usr/local/tomcat/build.sh 7

ENV JPDA_ADDRESS=5005
ENV JPDA_TRANSPORT=dt_socket

ENTRYPOINT ["catalina.sh", "jpda", "run"]

