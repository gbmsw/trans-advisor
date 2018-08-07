FROM websphere-liberty:javaee7
MAINTAINER jphernandez

# copy configuration file to docker image for trader server, necessary to run DayTrader
COPY ./server.xml /opt/ibm/wlp/usr/servers/defaultServer

# copy DayTrader app to container
COPY ./binary/application/daytrader-ee7.ear /opt/ibm/wlp/usr/servers/defaultServer/apps

# create Derby resources for DayTrader app
RUN cd /opt/ibm/wlp/usr/shared/resources && mkdir Daytrader7SampleDerbyLibs

COPY ./derby-10.10.1.1.jar /opt/ibm/wlp/usr/shared/resources/Daytrader7SampleDerbyLibs