# A SickBeard installation
#   with our preffered mount to the outside world
#   (I have my shows on a seperate NAS device)
FROM ubuntu
MAINTAINER Sjoerd

# Make sure we are up to date
RUN apt-get update

# From http://sickbeard.com/install.html#Source
# 1 -> is already satisfied 

# 2 ->
RUN apt-get -y install python-cheetah

# 3 -> 
ADD https://github.com/midgetspy/Sick-Beard/tarball/master /opt/
RUN tar -xvf /opt/master -C /opt && mv /opt/midgetspy-Sick-Beard-* /opt/sickbeard

# Expose our service
EXPOSE 8081

# Run docker with -v /mnt/synoVideos:/mnt/synoVideos to have
# our shows mounted in the container
VOLUME ["/mnt/synoVideos"]

# Building in a supervisor for easy running
RUN apt-get -y install python-setuptools
RUN easy_install supervisor
ADD .docker/supervisor.conf /opt/supervisor.conf
ADD .docker/run.sh /opt/run

CMD ["/bin/sh", "-e", "/opt/run"]
#CMD ["python", "/opt/sickbeard/SickBeard.py"]
