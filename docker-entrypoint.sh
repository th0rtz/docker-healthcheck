#!/bin/sh
#
#set -euo pipefail

cd /webapps/healthchecks
cp hc/local_settings.py.example hc/local_settings.py

host=`ip add|grep "/16"|cut -c10-19`

sed -i "s/HOST = \"localhost\".*HOST = \"$host\"/g" /webapps/healthchecks/hc/settings.py
sed -i "s/SITE_ROOT = \"http:\/\/localhost:8000\".*SITE_ROOT = \"http:\/\/$host:8000\"/g" /webapps/healthchecks/hc/settings.py

/usr/bin/python3 manage.py migrate
/usr/bin/python3 manage.py createsuperuser

/usr/bin/python3 manage.py runserver

