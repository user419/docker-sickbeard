#!/bin/bash

# Why are we using supervisor ??!?
# Probably a /usr/bin/python /opt/sickbeard/SickBeard.py -d
# will do along with an infinite sleep
# otherwise our container will stop after script has ended

supervisord -c /opt/supervisor.conf -n
