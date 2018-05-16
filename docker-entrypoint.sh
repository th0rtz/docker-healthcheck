#!/bin/sh
#
#set -euo pipefail

cd /webapps/healthchecks
cp hc/local_settings.py.example hc/local_settings.py

/usr/bin/python3 manage.py migrate
/usr/bin/python3 manage.py createsuperuser

/usr/bin/python3 manage.py runserver

